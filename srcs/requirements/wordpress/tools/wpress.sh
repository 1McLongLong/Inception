#!/bin/bash

################### wp cli Installation
sleep 10

MARIADB_PW=$(cat /run/secrets/db_user_pass)
ADMIN_PASS=$(cat /run/secrets/wp_admin_pass)
NUSER_PASS=$(cat /run/secrets/wp_user_pass)

# 1/ Download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp

################### wp Installation & Configuration

cd /var/www/wordpress
chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress # www-data is the default user and group for NGINX

# Downloads core WordPress files & Specify the path in which to install WordPress
wp core download --allow-root --path=/var/www/wordpress

# Create a wp-config.php file
wp core config --dbname=$MARIADB_NM --dbuser=$MARIADB_USER --dbpass=$MARIADB_PW --dbhost=mariadb:3306 --allow-root --path=/var/www/wordpress
# Install WP
wp core install --url=$DOMAIN --title=$WEBSITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --skip-email --allow-root --path=/var/www/wordpress
# Creates a new user
wp user create $NUSER_NAME $NUSER_EMAIL --role=author --user_pass=$NUSER_PASS --allow-root --path=/var/www/wordpress
# Install theme
wp theme install lowfi --activate --allow-root

################### php Configuration

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
