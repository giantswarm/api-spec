# Giant Swarm API Specification

This repository holds the specification for the Giant Swarm API, starting at version `v4`.

The specs are written in the [OpenAPI v2.0](https://github.com/OAI/OpenAPI-Specification/blob/master/versions/2.0.md) format, formerly known as Swagger.

The specification YAML files are:

- [`spec.yaml`](https://github.com/giantswarm/api-spec/blob/master/spec.yaml) - main specification file
- [`definitions.yaml`](https://github.com/giantswarm/api-spec/blob/master/definitions.yaml) - definition of models for request and response bodies
- [`parameters.yaml`](https://github.com/giantswarm/api-spec/blob/master/parameters.yaml) - definition of parameters used in paths and headers
- [`responses.yaml`](https://github.com/giantswarm/api-spec/blob/master/responses.yaml) - still unused


## Human-friendly API Documentation

We host a browser-friendly version at http://apispec.g8s.fra-1.giantswarm.io/

That documentation is a rendition of the specification of the `master` branch of this repository.

See the [`details`](https://github.com/giantswarm/api-spec/tree/master/details) folder of this repo for additional content about the API.

## Specification development

As usual, collaboration on this spec is done based on feature branches and pull requests.

For a feature branch pushed to this repository on GitHub, the documentation gets published automatically under `http://apispec.g8s.fra-1.giantswarm.io/<branch-name>/`.

Feature branches shall be merged into `master` only when the API functionality they describe is implemented and available to users of the Giant Swarm API.

### YAML conventions

Please obey these conventions when editing the spec YAML files:

- Indent using spaces, not tabs
- 2 spaces per indentation level
- avoid quotes where possible

### Rendering an HTML documentation preview

Use this command from the root directory of your clone of this repo:

```nohighlight
python -m SimpleHTTPServer 8000
```

Then open [`http://localhost:8000/redoc/`](http://localhost:8000/redoc/) to access your specs displayed via ReDoc.
