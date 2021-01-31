#!/bin/bash
touch /etc/sysconfig/iptables
touch /etc/sysconfig/iptables6
systemctl start iptables
systemctl start ip6tables
systemctl enable iptables
systemctl enable ip6tables

tar -xzf /opt/csf.tgz -C /opt &
sh /opt/csf/install.sh &
rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh

yes | cp -rf etc/sysctl.conf /etc/sysctl.conf

chmod 0644 /etc/csf/csfpre.sh
chmod 0644 /etc/sysctl.conf

