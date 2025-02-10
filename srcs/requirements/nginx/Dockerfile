FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/private/

RUN openssl req -x509 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt -subj "/CN=touahman.42.fr"

RUN mkdir -p /var/www/wordpress
RUN chmod -R 755 /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress # remove these RUNSS

COPY tools/nginx.sh /tools/

RUN chmod +x /tools/nginx.sh

ENTRYPOINT ["./tools/nginx.sh"]
 

