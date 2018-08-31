FROM node:10 as builder

WORKDIR /
RUN git clone --depth 1 https://github.com/Rebilly/ReDoc.git

WORKDIR /ReDoc/cli
RUN npm install -g
RUN npm run
RUN find / -type f -name "redoc-cli"
RUN which redoc-cli

ADD *.yaml /ReDoc/cli/
RUN redoc-cli bundle spec.yaml
RUN ls -la

FROM nginx:stable-alpine
RUN rm -r /etc/nginx/conf.d
#ADD docserver/index.html /www/
#ADD *.yaml /www/yaml/

#RUN mkdir /www/js
#ADD https://rebilly.github.io/ReDoc/releases/latest/redoc.min.js /www/js/redoc.min.js
#RUN chmod 0644 /www/js/redoc.min.js

ADD docserver/nginx.conf /etc/nginx/

EXPOSE 8000
