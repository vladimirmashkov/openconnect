#!/bin/bash
sudo yum update -y && yum upgrade -y
sudo timedatectl set-timezone Europe/Moscow
sudo yum install -y ntp ntpdate wget mc p7zip-full whois net-tools traceroute mtr sed
sudo ntpdate -s time.nist.gov
sudo cp -f "etc/resolv.conf" "/etc/resolv.conf"

mkdir -p -m 0644 /root/.ssh/
wget https://github.com/vladimirmashkov.keys -O "/root/.ssh/mashkov_key.pub"
cat /root/.ssh/mashkov_key.pub >> /root/.ssh/authorized_keys

sudo groupadd vpn_admin
sudo useradd -m albert -G vpn_admin
mkdir -p -m 0644 /home/albert/.ssh/
cat etc/albert_key.pub >> /home/albert/.ssh/authorized_keys
chmod -R 0644 /home/albert
chown -R albert /home/albert
chgrp -R albert /home/albert


sed -i "s/PasswordAuthentication yes/#PasswordAuthentication yes/g" /etc/ssh/sshd_config
cat etc/sshd_config >> /etc/ssh/sshd_config
sudo systemctl restart sshd