#!/bin/bash
yum install -y epel-release
yum -y update && yum -y upgrade
yum -y install iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph 
yum -y install ocserv gnutls-utils
yum -y update && yum -y upgrade

wget https://download.configserver.com/csf.tgz -P /opt

tar -xvzf /opt/csf.tgz -C /opt 

systemctl disable firewalld
systemctl stop firewalld

global_ip=$(ip a | grep -Eo 'inet.*brd.*global'| grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'| head -1)
echo ${global_ip}
sed -i "s/<global_ip>/${global_ip}/g" etc/csfpre.sh
