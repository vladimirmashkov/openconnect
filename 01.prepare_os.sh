#!/bin/bash
sudo yum update -y && yum upgrade -y
sudo timedatectl set-timezone Europe/Moscow
sudo yum install -y ntp ntpdate wget mc p7zip-full whois net-tools traceroute mtr sed
sudo ntpdate -s time.nist.gov
sudo yum update -y && yum upgrade -y
sudo cp -f "etc/resolv.conf" "/etc/resolv.conf"

