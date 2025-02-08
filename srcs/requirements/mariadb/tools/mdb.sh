#!/bin/bash

service mariadb start
sleep 5

MARIADB_PW=$(cat /run/secrets/db_user_pass)
MARIADB_R_PW=$(cat /run/secrets/db_root_pass)

mariadb -u root <<EOF
CREATE DATABASE IF NOT EXISTS $MARIADB_NM;
CREATE USER IF NOT EXISTS $MARIADB_USER@'%' IDENTIFIED BY '$MARIADB_PW';
GRANT ALL PRIVILEGES ON ${MARIADB_NM}.* TO $MARIADB_USER@'%';
FLUSH PRIVILEGES;
EOF

mysqladmin -u root -p$MARIADB_R_PW shutdown

exec mysqld_safe --bind-address=0.0.0.0
