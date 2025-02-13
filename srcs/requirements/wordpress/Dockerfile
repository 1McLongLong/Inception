FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php7.4-fpm php-mysql mariadb-client

RUN sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/fpm/pool.d/www.conf # This explicitly tells PHP-FPM to listen on all network interfaces (0.0.0.0) and port 9000 | modify the listen port from a Unix socket to port 9000 enables network communication between PHP-FPM and the web server container

COPY tools/wpress.sh /tools/

RUN chmod +x /tools/wpress.sh

RUN mkdir -p /var/www/wordpress

ENTRYPOINT ["./tools/wpress.sh"]
