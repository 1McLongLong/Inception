FROM debian:bullseye

RUN apt-get update && apt-get upgrade -y && apt-get install -y nginx openssl

RUN mkdir -p /etc/ssl/private/

RUN openssl req -x509 -nodes -keyout /etc/ssl/private/nginx-selfsigned.key -out /etc/ssl/private/nginx-selfsigned.crt -subj "/CN=touahman.42.fr"
# -x509: Outputs a self-signed certificate instead of a certificate request. / -nodes: Skips the option to encrypt the private key.

COPY tools/nginx.sh /tools/

RUN chmod +x /tools/nginx.sh

ENTRYPOINT ["./tools/nginx.sh"]
 

