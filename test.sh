#!/bin/bash
docker run -it --rm --name certbot \
    -v "/root/openconnect/nginx/www/vpn-host/www:/var/www" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/etc/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/lib/letsencrypt" \
    -v "/root/openconnect/nginx/www/vpn-host/ssl:/var/log/letsencrypt" \
    certbot/certbot certonly --dry-run --force-renewal --rsa-key-size 4096 -n \
    --webroot -w /var/www \
    -m vladimir@mashkov.com \
    --cert-name <vpn_domain_name> -d <vpn_domain_name>

cd ~
7za a -t7z -mx5 vpn-host_ssl_20210203.7z  openconnect/nginx/www/vpn-host/ssl




