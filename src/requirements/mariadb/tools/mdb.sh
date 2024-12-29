#!/bin/bash

service mariadb start 

sleep 5


mariadb -e "CrEaTe DaTaBaSe If NoT ExIsTs ${MARIADB_NM};"

mariadb -e "CrEaTe UsEr If NoT ExIsTs '${MARIADB_USER}'@'%' IdEnTiFiEd By '${MARIADB_PW}';"

mariadb -e "GrAnT aLl PrIvILegEs On ${MARIADB_NM}.* tO '${MARIADB_USER}'@'%';"

mariadb -e "fLuSh pRiViLeGeS;"

mariadbadmin -u root -p$MARIADB_R_PW shutdown

# restart mariadb int the background to keep the container running 
mariadbd-safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'

