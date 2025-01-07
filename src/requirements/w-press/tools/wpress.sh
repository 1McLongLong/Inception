#!/bin/bash

#################### wp cli Installation
sleep 10

# 1/ Download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp

################### wp Installation & Configuration

# mkdir /var/www/html && cd /var/www/html
chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress
cd /var/www/wordpress


wp core download --allow-root
mv wp-config-sample.php wp-config.php && wp config set SERVER_PORT 3306 --allow-root

wp config set DB_NAME $MARIADB_NM --allow-root --path=/var/www/wordpress
wp config set DB_USER $MARIADB_USER --allow-root --path=/var/www/wordpress
wp config set DB_PASSWORD $MARIADB_PW --allow-root --path=/var/www/wordpress
wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/wordpress


wp core install --url=$DOMAIN --title=$WEBSITE_NAME --admin_user=$ADMIN_NAME--admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/wordpress

wp user create $NUSER_NAME $NUSER_EMAIL --role=author --user_pass=$NUSER_PASS --allow-root --path=/var/www/wordpress

################### php Configuration

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F

