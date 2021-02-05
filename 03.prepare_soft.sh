#!/bin/bash
echo "========== Install CSF =========="
wget https://download.configserver.com/csf.tgz -P /opt

tar -xvzf /opt/csf.tgz -C /opt 

systemctl disable firewalld
systemctl stop firewalld

global_ip=$(ip a | grep -Eo 'inet.*brd.*global'| grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}'| head -1)
echo ${global_ip}
sed -i "s/<global_ip>/${global_ip}/g" etc/csfpre.sh
