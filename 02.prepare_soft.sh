#!/bin/bash
yum install -y epel-release
yum -y update && yum -y upgrade
yum -y install --enablerepo=epel iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph 
yum -y install --enablerepo=epel ocserv gnutls-utils
yum -y install --enablerepo=epel nginx snapd
yum -y update && yum -y upgrade

wget https://download.configserver.com/csf.tgz -P /opt

tar -xvzf /opt/csf.tgz -C /opt 

systemctl disable firewalld
systemctl stop firewalld

global_ip=$(ip a | grep -Eo 'inet.*brd.*global'| grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'| head -1)
echo ${global_ip}
sed -i "s/<global_ip>/${global_ip}/g" etc/csfpre.sh


mkdir -p -m 0644 /var/www/${domain_name}/html
chmod -R 0777 /var/www
yes | cp -rf etc/vpn-host.conf /etc/nginx/conf.d/vpn-host.conf

sed -i "s/<domain_name>/${domain_name}/g" /etc/nginx/conf.d/vpn-host.conf

ln -s /var/lib/snapd/snap /snap
snap install core; snap refresh core
snap install --classic certbot
ln -s /snap/bin/certbot /usr/bin/certbot

