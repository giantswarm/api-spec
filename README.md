# api-spec

This repository holds the specification for the Giant Swarm API.

The Giant Swarm API is a Restful HTTP API which uses JSON as a standard format for request and response bodies.

## Response codes

Error messages and standard responses, like the ones returned after creating a resource via a POST request, use the same standard format:

```json
{
  "code": "...",
  "message": "..."
}
```

The `code` is a documented, machine readable string identifier. See [RESPONSE_CODES.md](https://github.com/giantswarm/api-spec/blob/master/RESPONSE_CODES.md) for a list of response codes.

The `message` part gives additional information intended for end users, not meant to be machine readable.
