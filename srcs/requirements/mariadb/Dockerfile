FROM debian:bullseye

#for scripting and automation, apt-get is better due to its stability and greater control over system upgrades and maintenance tasks

RUN apt-get update && apt-get upgrade -y && apt-get install -y mariadb-server mariadb-client netcat

COPY ./tools/mdb.sh /mdb.sh
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/50-server.cnf

RUN chmod +x /mdb.sh

ENTRYPOINT ["./mdb.sh"]

