PWD := $(shell pwd)
PHONY: lint spec-tmp.yaml

# lint runs yamlint against the spec files
lint:
	docker run --rm -ti \
		-v $(PWD):/workdir \
		-w /workdir \
		giantswarm/yamllint \
		-c ./yamllint/config.yaml \
		./spec/*

# Validate the swagger/OAI spec
validate: lint
	docker run --rm -v ${PWD}:/local openapitools/openapi-generator-cli generate \
			-i /local/spec/spec.yaml \
			-g javascript \
			-o /out/javascript

# Run a server to show the HTML docs UI on http://localhost:8080
run-server:
	docker build -t api-spec-dev -f Dockerfile .
	docker run --rm -p 8080:8000 api-spec-dev
