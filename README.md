# Giant Swarm API Specification

## API Documentation

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
