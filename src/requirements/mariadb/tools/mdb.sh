#!/bin/bash

systemctl start mariadb

sleep 5


mariadb -e "CrEaTe DaTaBaSe If NoT ExIsTs \'${MARIADB_NM}\';"

mariadb -e "CrEaTe UsEr If NoT ExIsTs \'${MARIADB_USER}\'@'%' IdEnTiFiEd By \'${MARIADB_PW}\';"

mariadb -e "GrAnT aLl PrIvILegEs On ${MARIADB_NM}.* tO \'${MARIADB_USER}\'@'%';"

mariadb -e "fLuSh pRiViLeGeS;"

mariadbadmin -u root -p $MARIADB_R_PW shutdown




