#!/bin/bash
rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

mkdir -p -m 0644 ./ocserv_t2/certs/
mkdir -p -m 0644 ./ocserv_t3/certs/

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh

yes | cp -rf etc/sysctl.conf /etc/sysctl.conf

touch ./ocserv_t2/passwd
touch ./ocserv_t3/passwd

chmod 0644 /etc/csf/csfpre.sh
chmod 0644 /etc/sysctl.conf
chmod 0644 ./ocserv_t2/passwd
chmod 0644 ./ocserv_t3/passwd
chmod 0644 cert_renew.sh
chmod 0644 cert_get_new.sh
