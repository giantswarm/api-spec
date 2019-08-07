# Step 1: create a filtered spec that does not contain the x-internal operations.
FROM node:10-alpine AS builder
WORKDIR /workdir
RUN npm init --force
RUN npm install openapi-filter@1.3.0
ADD spec/spec.yaml /workdir/
RUN ./node_modules/.bin/openapi-filter /workdir/spec.yaml /workdir/spec-filtered.yaml

# Step 2: Create webserver
FROM nginx:1.16-alpine
RUN rm -r /etc/nginx/conf.d
ADD docserver/index.html /www/
# Use filtered spec (not containing internal operations)
ADD spec/paths /www/yaml/paths
ADD spec/components.yaml /www/yaml/components.yaml
COPY --from=builder /workdir/spec-filtered.yaml /www/yaml/spec.yaml

RUN mkdir /www/js
ADD https://cdn.jsdelivr.net/npm/redoc@next/bundles/redoc.standalone.js /www/js/redoc.min.js
RUN chmod 0644 /www/js/redoc.min.js

ADD docserver/nginx.conf /etc/nginx/

EXPOSE 8000
