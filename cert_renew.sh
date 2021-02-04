#!/bin/bash
docker run -it --rm --name certbot \
    -v "/root/openconnect/nginx/www/vpn-host/www:/var/www" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/etc/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/lib/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/log/letsencrypt" \
    certbot/certbot certonly --force-renewal --rsa-key-size 4096 -n \
    --webroot -w /var/www \
    -m vladimir@mashkov.com \
    --cert-name <vpn_domain_name> -d <vpn_domain_name> 

# https://certbot.eff.org/docs/using.html