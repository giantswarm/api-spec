FROM nginx:1.16-alpine
RUN rm -r /etc/nginx/conf.d
ADD docserver/index.html /www/
ADD *.yaml /www/yaml/

RUN mkdir /www/js
ADD https://rebilly.github.io/ReDoc/releases/latest/redoc.min.js /www/js/redoc.min.js
RUN chmod 0644 /www/js/redoc.min.js

ADD docserver/nginx.conf /etc/nginx/

EXPOSE 8000
