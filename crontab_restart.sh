#!/bin/bash
cd /root/openconnect
/usr/bin/chmod 0755 /root/openconnect/*.sh
/usr/bin/touch /root/openconnect/ocserv/passwd.txt
/usr/bin/chmod 0777 /root/openconnect/ocserv/passwd.txt
/usr/bin/read -t 3

/usr/bin/systemctl stop docker.sock
/usr/bin/read -t 3

/usr/bin/systemctl start docker.sock
/usr/bin/read -t 3

/usr/bin/systemctl restart docker
/usr/bin/read -t 3

docker-compose down
/usr/bin/read -t 3

docker-compose up -d
