#!/bin/bash
csf -r
sysctl -p


systemctl stop docker
systemctl start docker

systemctl enable docker-compose-ocserv
systemctl start docker-compose-ocserv


echo "========== To show a status =========="
systemctl status iptables
systemctl status ip6tables
systemctl status csf
systemctl status docker

