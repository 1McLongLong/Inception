#!/bin/bash

echo "
events {}
http {
	server {
			listen 443 ssl;
			ssl_protocols TLSv1.3;
			ssl_certificate  /etc/ssl/private/nginx-selfsigned.crt;
			ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;

			server_name $DOMAIN;
			root /var/www/wordpress;
			index index.php;
			location ~ \.php$ {
				include snippets/fastcgi-php.conf;
				fastcgi_pass wordpress:9000;
			}
		}
	}
	" > /etc/nginx/nginx.conf
  # configuration file that contains standard settings for handling PHP with FastCGI.
  # This tells the web server where to send the PHP requests for processing. 9000 is the port number that the PHP processor is listening on. / 
  # "Send the PHP request to the PHP processor running at wordpress:9000."
nginx -g "daemon off;"
# test docker exec <container> ps -ef
