#!/bin/bash
cd /root/openconnect
/usr/bin/chmod 0755 /root/openconnect/*.sh
/usr/bin/chmod 0777 /root/openconnect/etc/ocserv/passwd.txt
/usr/bin/read -t 3

docker-compose down
/usr/bin/read -t 3

rm -f /root/openconnect/docker-compose.yaml
yes | cp /root/openconnect/docker-compose.yaml.bak.nginx /root/openconnect/docker-compose.yaml
/usr/bin/read -t 3

docker-compose up -d
/usr/bin/read -t 5

/root/openconnect/cert_renew.sh
/usr/bin/read -t 5

docker-compose down
/usr/bin/read -t 3

rm -f /root/openconnect/docker-compose.yaml
yes | cp /root/openconnect/docker-compose.yaml.bak.ocs /root/openconnect/docker-compose.yaml
/usr/bin/read -t 3

docker-compose up -d


