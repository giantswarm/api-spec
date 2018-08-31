FROM node:8-slim as builder

RUN npm -v
RUN npm install redoc

ADD *.yaml /
RUN npx redoc-cli bundle spec.yaml
RUN ls -la

FROM nginx:stable-alpine
RUN rm -r /etc/nginx/conf.d
ADD docserver/nginx.conf /etc/nginx/

COPY --from=builder /redoc-static.html /www/index.html
RUN chmod 0644 /www/*


EXPOSE 8000
