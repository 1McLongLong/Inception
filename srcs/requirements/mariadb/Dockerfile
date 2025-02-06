FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server

COPY ./tools/mdb.sh /mdb.sh

RUN chmod +x /mdb.sh

ENTRYPOINT ["./mdb.sh"]

