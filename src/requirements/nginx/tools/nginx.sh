#!/bin/bash

# server_name touahman.42.fr;
echo "server {
		listen 4040 ssl;
		ssl_certificate  /etc/ssl/private/nginx-selfsigned.crt;
		ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
		ssl_protocols TLSv1.3;

		root /var/www/wordpress;
		server_name localhost;
		index index.php;
		location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass wordpress:9000;
		}
	}
	" > /etc/nginx/conf.d/nginx.conf
#   " >> /etc/nginx/sites-available/default

nginx -g "daemon off;"
