#!/bin/bash
rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

# mkdir -p -m 0644 /etc/ocserv/ssl/

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh

yes | cp -rf etc/sysctl.conf /etc/sysctl.conf

# yes | cp -rf etc/ca-cert.pem /etc/ocserv/ssl/ca-cert.pem

# yes | cp -rf etc/client-cert.pem /etc/ocserv/ssl/client-cert.pem

# yes | cp -rf etc/client-key.pem /etc/ocserv/ssl/client-key.pem

# yes | cp -rf etc/ocserv.conf /etc/ocserv/ocserv.conf

# touch /etc/ocserv/passwd

chmod 0644 /etc/csf/csfpre.sh
chmod 0644 /etc/sysctl.conf
# chmod 0644 /etc/ocserv/ssl/ca-cert.pem
# chmod 0644 /etc/ocserv/ssl/client-cert.pem
# chmod 0644 /etc/ocserv/ssl/client-key.pem
# chmod 0644 /etc/ocserv/ocserv.conf
# chmod 0644 /etc/ocserv/passwd

# systemctl enable ocserv