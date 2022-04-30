#!/bin/bash
cd /root/openconnect
/usr/bin/chmod 0755 /root/openconnect/*.sh
/usr/bin/touch /root/openconnect/ocserv/passwd.txt
/usr/bin/chmod 0777 /root/openconnect/ocserv/passwd.txt
/usr/bin/read -t 3

docker-compose down
/usr/bin/read -t 3

rm -f /root/openconnect/docker-compose.yaml
yes | cp /root/openconnect/docker-compose.yaml.bak.nginx /root/openconnect/docker-compose.yaml
/usr/bin/read -t 3

docker-compose up -d
/usr/bin/read -t 5


docker run -it --rm --name certbot \
    -v "/root/openconnect/nginx/www/vpn-host/www:/var/www" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/etc/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/lib/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/log/letsencrypt" \
    certbot/certbot certonly --rsa-key-size 4096  --agree-tos -n \
    --webroot -w /var/www \
    -m vladimir@mashkov.com \
    --cert-name <vpn_domain_name> -d <vpn_domain_name> 

# https://certbot.eff.org/docs/using.html


/usr/bin/read -t 5

docker-compose down
/usr/bin/read -t 3

rm -f /root/openconnect/docker-compose.yaml
yes | cp /root/openconnect/docker-compose.yaml.bak.ocs /root/openconnect/docker-compose.yaml

yes | cp /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/cert.pem  /root/openconnect/ocserv/certs/cert.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/chain.pem  /root/openconnect/ocserv/certs/chain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/fullchain.pem  /root/openconnect/ocserv/certs/fullchain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/privkey.pem  /root/openconnect/ocserv/certs/privkey.pem
#########################################################

/usr/bin/read -t 3

docker-compose up -d
/usr/bin/read -t 3
