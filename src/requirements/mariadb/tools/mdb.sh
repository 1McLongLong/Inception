#!/bin/bash

mysqld_safe &
sleep 5

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS $MARIADB_NM;
CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PW';
GRANT ALL PRIVILEGES ON ${MARIADB_NM}.* TO $MARIADB_USER@'%';
FLUSH PRIVILEGES;
EOF

# mysql -e "ALTER USER 'root'@'localhost' IDENTIFIED BY '$MARIADB_R_PW';"

mysqladmin -u root -p$MARIADB_R_PW shutdown

# restart mariadb int the background to keep the container running 
# mysqld_safe --port=3306 --bind-address=0.0.0.0 --datadir='/var/lib/mysql'
exec mysqld_safe
