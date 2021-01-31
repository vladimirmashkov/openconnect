#!/bin/bash
touch /etc/sysconfig/iptables
touch /etc/sysconfig/iptables6
systemctl start iptables
systemctl start ip6tables
systemctl enable iptables
systemctl enable ip6tables

mkdir -p -m 0777 /opt/csf1
tar -xzf /opt/csf.tgz -C /opt/csf1
