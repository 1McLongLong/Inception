#!/bin/bash

echo "events {
	
}

http {

	include /etc/nginx/mime.types;
	server {
		listen 443 ssl;
		ssl_certificate  /etc/ssl/private/nginx-selfsigned.crt;
		ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
		ssl_protocols TLSv1.3;

		root /var/www/wordpress;
		server_name touahman.42.fr;
		index index.php;
		location ~ \.php$ {
			include snippets/fastcgi-php.conf;
			fastcgi_pass wordpress:9000;
		}
	}
}" > /etc/nginx/nginx.conf

nginx -g "daemon off;"
