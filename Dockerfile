FROM nginx:1.14-alpine
RUN rm -r /etc/nginx/conf.d
ADD docserver/index.html /www/
ADD *.yaml /www/yaml/
ADD docserver/nginx.conf /etc/nginx/
EXPOSE 8000
