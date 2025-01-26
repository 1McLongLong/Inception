#!/bin/bash

################### wp cli Installation
sleep 10

# 1/ Download wp-cli
curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
# 2/ Make it executable
chmod +x wp-cli.phar
# 3/ Move it into /usr/local/bin/wp
mv wp-cli.phar /usr/local/bin/wp

################### wp Installation & Configuration

# echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf


# cd /var/www/wordpress
chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress

# Downloads core WordPress files & Specify the path in which to install WordPress
wp core download --allow-root --path=/var/www/wordpress

# Create a wp-config.php file
wp core config --dbname=$MARIADB_NM --dbuser=$MARIADB_USER --dbpass=$MARIADB_PW --dbhost=mariadb:3306 --allow-root --path=/var/www/wordpress
# Install WP
wp core install --url=$DOMAIN --title=$WEBSITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/wordpress
# Creates a new user
wp user create $NUSER_NAME $NUSER_EMAIL --role=author --user_pass=$NUSER_PASS --allow-root --path=/var/www/wordpress

################### php Configuration

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
