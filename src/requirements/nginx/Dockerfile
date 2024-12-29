FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/private/

RUN openssl req -x509 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt \
    -subj "/C=MO/L=KH/O=42/OU=1337/CN=touahman.1337.ma/UID=touahman"

COPY ./tools/nginx.conf /etc/nginx/nginx.conf

RUN mkdir -p /var/www/wordpress/

RUN chown -R www-data:www-data /var/www/wordpress

ENTRYPOINT ["nginx", "-g", "daemon off;"]
 

