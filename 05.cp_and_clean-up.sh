#!/bin/bash
rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

mkdir -p -m 0644 ./ocserv/certs/

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh

yes | cp -rf etc/sysctl.conf /etc/sysctl.conf

touch ./ocserv/passwd

chmod 0644 /etc/csf/csfpre.sh
chmod 0644 /etc/sysctl.conf
chmod 0644 ./ocserv/passwd


cat /root/openconnect/nginx/www/vpn-host/ssl/live/www0.music-tm.com/cert.pem > /root/openconnect/ocserv/certs/cert.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/www0.music-tm.com/chain.pem > /root/openconnect/ocserv/certs/chain.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/www0.music-tm.com/fullchain.pem > /root/openconnect/ocserv/certs/fullchain.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/www0.music-tm.com/privkey.pem > /root/openconnect/ocserv/certs/privkey.pem

