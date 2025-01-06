#!/bin/bash

echo "server {
    listen 443 ssl;
    server_name touahman.42.fr;

    ssl_certificate /etc/ssl/private/nginx-selfsigned.crt;
    ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
    ssl_protocols TLSv1.3;

    index index.php;
    root /var/www/html;

    location ~ \.php$ {
              include snippets/fastcgi-php.conf;
              fastcgi_pass wordpress:9000;
    }
  }" >> etc/nginx/sites-available/default

nginx -g "daemon off;"
