FROM debian:11

RUN apt-get update && apt-get upgrade -y && apt-get install -y curl php php-mysql php-fpm maridb-client

COPY ./tools/wpress.sh /tools/

RUN chmod +x /tools/wpress.sh

ENTRYPOINT ["./tools/wpress.sh"]

