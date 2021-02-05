#!/bin/bash
touch /etc/sysconfig/iptables
touch /etc/sysconfig/iptables6
systemctl start iptables
systemctl start ip6tables
systemctl enable iptables
systemctl enable ip6tables

cur_dir=$(pwd)
cd /opt/csf/
sh install.sh 
cd $cur_dir

sed -i 's/ICMP_IN = "1"/ICMP_IN = "0"/g' /etc/csf/csf.conf
sed -i 's/TESTING = "1"/TESTING = "0"/g' /etc/csf/csf.conf
sed -i 's/TESTING_INTERVAL = "5"/TESTING_INTERVAL = "0"/g' /etc/csf/csf.conf

sed -i 's/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995"/TCP_IN = "20,21,22,25,53,80,110,143,443,465,587,993,995,4443"/g' /etc/csf/csf.conf
sed -i 's/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995"/TCP_OUT = "20,21,22,25,53,80,110,113,443,587,993,995,4443"/g' /etc/csf/csf.conf