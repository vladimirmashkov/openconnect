#!/bin/bash
yum update -y && yum upgrade -y
yum install -y epel-release
timedatectl set-timezone Europe/Moscow
echo "========== Install 7zip =========="
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-16.02-10.el7.x86_64.rpm
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-plugins-16.02-10.el7.x86_64.rpm
rpm -U --quiet p7zip-16.02-10.el7.x86_64.rpm
rpm -U --quiet p7zip-plugins-16.02-10.el7.x86_64.rpm

rm -f p7zip-16.02-10.el7.x86_64.rpm
rm -f p7zip-plugins-16.02-10.el7.x86_64.rpm

yum install -y --enablerepo=epel ntp ntpdate wget mc whois net-tools traceroute mtr sed
ntpdate -s time.nist.gov

cp -f "etc/resolv.conf" "/etc/resolv.conf"
echo "========== Install Docker =========="
yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

echo "========== Install Docker Compose =========="
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl start docker
systemctl enable docker

echo "========== download old certificates =========="
wget http://mashkov.com/wp-content/uploads/2021/02/vpn-host_ssl_20210203.7z
7z x vpn-host_ssl_20210203.7z
chmod -R 0644 openconnect/

no | cp -fr $(pwd)/openconnect/* $(pwd)

rm -fr openconnect

yum update -y && yum upgrade -y
echo "========== update environment =========="
chmod +x vpn_domain_name.sh
cp vpn_domain_name.sh /etc/profile.d/
