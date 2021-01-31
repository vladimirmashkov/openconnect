#!/bin/bash
yum -y update && yum -y upgrade
yum install -y epel-release
yum -y update && yum -y upgrade
yum -y install iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph ocserv gnutls-utils
yum -y update && yum -y upgrade

systemctl disable firewalld
systemctl stop firewalld

global_ip=$(ip a | grep -Eo 'inet.*brd.*global'| grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'| head -1)
echo ${global_ip}
sed -i "s/<global_ip>/${global_ip}/g" etc/csfpre.sh
