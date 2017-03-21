validate:
	# Create concatenated spec file
	rm -f spec-tmp.yaml
	cat spec.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat definitions.yaml >> spec-tmp.yaml
	echo "" >> spec-tmp.yaml
	cat parameters.yaml >> spec-tmp.yaml
	# fix references
	sed -ie 's/definitions\.yaml//g' spec-tmp.yaml
	sed -ie 's/parameters\.yaml//g' spec-tmp.yaml
	# run swagger codegen
	docker run --rm -it \
		-v ${PWD}:/swagger-api/yaml \
		jimschubert/swagger-codegen-cli generate \
		--input-spec /swagger-api/yaml/spec-tmp.yaml \
		--lang swagger --output /tmp/
	# remove temp file
	rm spec-tmp.yaml
