FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/private/

RUN openssl req -x509 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt \
    -subj "/C=MO/L=KH/O=42/OU=1337/CN=touahman.42.fr/UID=touahman"

RUN chmod 755 /var/www/html
RUN chown -R www-data:www-data /var/www/html


COPY tools/nginx.sh /tools/

RUN chmod +x /tools/nginx.sh

ENTRYPOINT ["./tools/nginx.sh"]
 

