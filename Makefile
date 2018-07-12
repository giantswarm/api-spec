PWD := $(shell pwd)
PHONY: lint spec-tmp.yaml

SWAGGER_VERSION=2.2.3

# Create concatenated spec file for linting and validation
spec-tmp.yaml:
	cat spec.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat definitions.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat parameters.yaml >> spec-tmp.yaml
	# fix references
	sed -ie 's:\./definitions\.yaml::g' spec-tmp.yaml
	sed -ie 's:\./parameters\.yaml::g' spec-tmp.yaml

# YAML linting
lint: spec-tmp.yaml
	docker run --rm -ti \
		-v $(PWD):/workdir \
		-w /workdir \
		giantswarm/yamllint \
		-c ./yamllint/config.yaml \
		./spec.yaml ./definitions.yaml ./parameters.yaml ./responses.yaml

# Validate the swagger/OAI spec
validate: spec-tmp.yaml lint
	@echo "Generating swagger representation"
	docker run --rm -it \
		-v $(shell pwd):/code/yaml \
		jimschubert/swagger-codegen-cli:${SWAGGER_VERSION} generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang swagger --output /tmp/

	@echo "Generating static HTML documentation"
	docker run --rm -it \
		-v $(shell pwd):/code/yaml \
		-v $(shell pwd)/html:/code/html \
		jimschubert/swagger-codegen-cli:${SWAGGER_VERSION} generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang html --output /code/html

	@echo "Generating JavaScript client code for test purposes"
	docker run --rm -it \
		-v $(shell pwd):/code/yaml \
		-v $(shell pwd)/javascript:/code/javascript \
		jimschubert/swagger-codegen-cli:${SWAGGER_VERSION} generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang javascript --output /code/javascript

	# remove temp files
	rm -f spec-tmp.yaml
	rm -f spec-tmp.yamle

# This is exclusively for testing on CircleCI.
# The --rm=false is required to prevent an error on CircleCI.
test: lint
	yamllint -c ./yamllint/config.yaml ./spec.yaml ./definitions.yaml ./parameters.yaml ./responses.yaml
	docker run --rm=false -it \
		-v $(shell pwd):/code/yaml \
		jimschubert/swagger-codegen-cli:${SWAGGER_VERSION} generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang swagger --output /tmp/
	docker run --rm=false -it \
		-v $(shell pwd):/code/yaml \
		jimschubert/swagger-codegen-cli:${SWAGGER_VERSION} generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang javascript --output /tmp/
	# remove temp files
	rm -f spec-tmp.yaml
	rm -f spec-tmp.yamle

# Run a server to show the HTML docs UI on http://localhost:8000
run-server:
	docker build -t api-spec-dev -f Dockerfile .
	docker run -v ${PWD}:/www/yaml -p 8080:8000 api-spec-dev

clean:
	rm -rf spec-tmp.yaml* javascript html dynamic-html
