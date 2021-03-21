#!/bin/bash
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

yes | cp /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/cert.pem  /root/openconnect/ocserv_t2/certs/cert.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/chain.pem  /root/openconnect/ocserv_t2/certs/chain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/fullchain.pem  /root/openconnect/ocserv_t2/certs/fullchain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/privkey.pem  /root/openconnect/ocserv_t2/certs/privkey.pem


yes | cp /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/cert.pem  /root/openconnect/ocserv_t3/certs/cert.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/chain.pem  /root/openconnect/ocserv_t3/certs/chain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/fullchain.pem  /root/openconnect/ocserv_t3/certs/fullchain.pem

yes | cp  /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/privkey.pem  /root/openconnect/ocserv_t3/certs/privkey.pem
