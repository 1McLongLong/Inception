FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php-mysqlnd php-fpm mariadb-client

COPY tools/wpress.sh /tools/

RUN chmod +x /tools/wpress.sh

RUN mkdir -p /var/www/wordpress

ENTRYPOINT ["./tools/wpress.sh"]

