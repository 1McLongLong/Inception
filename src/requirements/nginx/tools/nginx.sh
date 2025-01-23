#!/bin/bash

# server_name touahman.42.fr;
echo "
events {}
http {
	server {
			listen 4040 ssl;
			ssl_protocols TLSv1.3;
			ssl_certificate  /etc/ssl/private/nginx-selfsigned.crt;
			ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

			server_name localhost;
			root /var/www/wordpress;
			index index.php;
			location ~ \.php$ {
				include snippets/fastcgi-php.conf;
				fastcgi_pass wordpress:9000;
			}
		}
	}
	" > /etc/nginx/nginx.conf
	# " > /etc/nginx/conf.d/nginx.conf

nginx -g "daemon off;"
