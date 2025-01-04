#!/bin/bash

#################### wp cli Installation

# 1/ Download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp


################### wp Installation & Configuration

mkdir /var/www/html && cd /var/www/html
wp core download --allow-root
# Create php file
wp core config --dbhost=mariadb:3336 --dbname="$MARIADB_NM" --dbuser="$MARIADB_USER" --dbpass="$MARIADB_PW" --allow-root
# Install wp
wp core install --url="$DOMAIN" --title="$WEBSITE_NAME" --admin_user="$ADMIN_NAME" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_EMAIL" --allow-root
# Create new user
wp user create "$NUSER_NAME" "$NUSER_EMAIL" --user_pass="$NUSER_PASS" --role="$NUSER_ROLE" --allow-root

################### php Configuration

sed -i 's#listen = /run/php/php7.4-fpm.sock#listen = 0.0.0.0:9000#' /etc/php/7.4/pool.d/www.conf

mkdir /run/php

/usr/sbin/php-fpm7.4 -F

