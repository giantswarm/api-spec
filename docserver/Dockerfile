FROM nginx:1.11
RUN rm -r /etc/nginx/conf.d
ADD redoc/index.html /www/index.html
ADD *.yaml /www/
ADD docserver/nginx.conf /etc/nginx/nginx.conf
EXPOSE 8000
