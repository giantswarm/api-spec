[![Docker Repository on Quay](https://quay.io/repository/giantswarm/api-spec/status "Docker Repository on Quay")](https://quay.io/repository/giantswarm/api-spec)

# Giant Swarm API Specification

This repository holds the specification for the Giant Swarm API, starting at version `v4`.

The specs are written in the [OpenAPI v2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md) format, formerly known as Swagger.

The specification YAML files are:

- [`spec.yaml`](https://github.com/giantswarm/api-spec/blob/master/spec.yaml) - main specification file
- [`definitions.yaml`](https://github.com/giantswarm/api-spec/blob/master/definitions.yaml) - definition of models for request and response bodies
- [`parameters.yaml`](https://github.com/giantswarm/api-spec/blob/master/parameters.yaml) - definition of parameters used in paths and headers
- [`responses.yaml`](https://github.com/giantswarm/api-spec/blob/master/responses.yaml) - still unused


## Human-friendly API Documentation

We host a browser-friendly version at https://docs.giantswarm.io/api/

That documentation is a rendition of the specification of the `master` branch of this repository.

See the [`details`](https://github.com/giantswarm/api-spec/tree/master/details) folder of this repo for additional content about the API.

## Specification development

As usual, collaboration on this spec is done based on feature branches and pull requests.

Feature branches shall be merged into `master` only when the API functionality they describe is implemented and available to users of the Giant Swarm API.

### Conventions

- Attribute names use only lowercase letters and the underscore as a seperator, like `attribute_name`.
- Paths/routes have a trailing slash (`/path/` instead of `/path`)
- Time data is given in the form `"2000-01-01T12:00:00.000Z"`. The number of decimal places for the seconds component may vary.

### YAML conventions

Please obey these conventions when editing the spec YAML files:

- Indent using spaces, not tabs
- 2 spaces per indentation level
- avoid quotes where possible

### Validation

Run `make validate` to check the specification YAML integrity.

This requires `yamllint` to be available. To install it, either do `sudo pip install yamllint` or create the following alias:

```
alias yamllint="docker run --rm -ti -v $(pwd):/workdir giantswarm/yamllint"
```

### Rendering an HTML documentation preview

Use this command from the root directory of your clone of this repo:

```nohighlight
make run-server
```

Then open [`http://localhost:8080/`](http://localhost:8080/) to access your specs displayed via ReDoc.

