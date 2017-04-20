spec-tmp.yaml:
	# Create concatenated spec file
	cat spec.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat definitions.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat parameters.yaml >> spec-tmp.yaml
	# fix references
	sed -ie 's/definitions\.yaml//g' spec-tmp.yaml
	sed -ie 's/parameters\.yaml//g' spec-tmp.yaml

validate: spec-tmp.yaml
	# For local validation
	yamllint -c ./yamllint/config.yaml ./spec.yaml ./definitions.yaml ./parameters.yaml ./responses.yaml
	docker run --rm -it \
		-v $(shell pwd):/code/yaml \
		jimschubert/swagger-codegen-cli generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang swagger --output /tmp/
	# remove temp files
	rm -f spec-tmp.yaml
	rm -f spec-tmp.yamle

test: spec-tmp.yaml
	# For CircleCI (--rm=false required)
	yamllint -c ./yamllint/config.yaml ./spec.yaml ./definitions.yaml ./parameters.yaml ./responses.yaml
	docker run --rm=false -it \
		-v $(shell pwd):/code/yaml \
		jimschubert/swagger-codegen-cli generate \
		--input-spec /code/yaml/spec-tmp.yaml \
		--lang swagger --output /tmp/
	# remove temp files
	rm -f spec-tmp.yaml
	rm -f spec-tmp.yamle
