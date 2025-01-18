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

# mkdir /var/www/html && cd /var/www/html

# echo "listen = 9000" >> /etc/php/7.4/fpm/pool.d/www.conf


cd /var/www/wordpress
chmod -R 755 /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress


wp core download --allow-root --path=/var/www/wordpress
# mv wp-config-sample.php wp-config.php && wp config create --allow-root

# wp config set DB_NAME $MARIADB_NM --allow-root --path=/var/www/wordpress
# wp config set DB_USER $MARIADB_USER --allow-root --path=/var/www/wordpress
# wp config set DB_PASSWORD $MARIADB_PW --allow-root --path=/var/www/wordpress
# wp config set DB_HOST 'mariadb:3306' --allow-root --path=/var/www/wordpress

# wp config create --dbname=$MARIADB_NM --dbuser=$MARIADB_USER --dbpass=$MARIADB_PW --dbhost=mariadb:3306 --allow-root --path=/var/www/wordpress
wp core config --dbname=$MARIADB_NM --dbuser=$MARIADB_USER --dbpass=$MARIADB_PW --dbhost=mariadb:3306 --allow-root --path=/var/www/wordpress

wp core install --url=localhost --title=$WEBSITE_NAME --admin_user=$ADMIN_NAME --admin_password=$ADMIN_PASS --admin_email=$ADMIN_EMAIL --allow-root --path=/var/www/wordpress

wp user create $NUSER_NAME $NUSER_EMAIL --role=author --user_pass=$NUSER_PASS --allow-root --path=/var/www/wordpress

################### php Configuration

mkdir -p /run/php

/usr/sbin/php-fpm7.4 -F
