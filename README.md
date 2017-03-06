# Giant Swarm API Specification

This repository holds the specification for the Giant Swarm API.

## Human-friendly API Documentation

ReDoc renders pretty useful HTML-based documentation. Use this command to launch a server locally, from the root directory of this repository:

```nohighlight
python -m SimpleHTTPServer 8000
```

Then open [`http://localhost:8000/redoc/`](http://localhost:8000/redoc/).

### Alternatives

- https://bootprint.knappi.org/ provides a documentation viewer. Paste your `spec.yaml` there and it will generate a simple HTML documentation on one page.
- http://editor.swagger.io/ allows to edit YAML specs, preview a documentation and generate server and client code.

### YAML conventions

- Indent using spaces, not tabs
- 2 spaces per indentation level
- avoid quotes where possible

## Error response codes

Error messages and standard responses, like the ones returned after creating a resource via a POST request, use the same standard format:

```json
{
  "code": "...",
  "message": "..."
}
```

The `code` is a documented, machine readable string identifier. See [RESPONSE_CODES.md](https://github.com/giantswarm/api-spec/blob/master/details/RESPONSE_CODES.md) for a list of response codes.

The `message` part gives additional information intended for end users, not meant to be machine readable.
