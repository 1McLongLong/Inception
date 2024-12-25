FROM debian:11

#for scripting and automation, apt-get is better due to its stability and greater control over system upgrades and maintenance tasks

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y mariadb-server netcat

COPY ./tools/mdb.sh /mdb.sh

RUN chmod +x /mdb.sh

ENTRYPOINT ["./mdb.sh"]

