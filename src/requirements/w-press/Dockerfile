FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysqlnd mariadb-client

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf

COPY tools/wpress.sh /tools/

RUN chmod +x /tools/wpress.sh

RUN mkdir -p /var/www/wordpress

ENTRYPOINT ["./tools/wpress.sh"]

