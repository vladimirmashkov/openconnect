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


cat /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/cert.pem > /root/openconnect/ocserv/certs/cert.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/chain.pem > /root/openconnect/ocserv/certs/chain.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/fullchain.pem > /root/openconnect/ocserv/certs/fullchain.pem
cat /root/openconnect/nginx/www/vpn-host/ssl/live/<vpn_domain_name>/privkey.pem > /root/openconnect/ocserv/certs/privkey.pem

