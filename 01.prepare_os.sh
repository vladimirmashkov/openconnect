#!/bin/bash
yum update -y && yum upgrade -y
yum install -y epel-release
timedatectl set-timezone Europe/Moscow
yum install -y --enablerepo=epel ntp ntpdate wget mc whois net-tools traceroute mtr sed
yum -y install --enablerepo=epel iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph 
ntpdate -s time.nist.gov

echo "========== Install 7zip =========="
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-16.02-10.el7.x86_64.rpm
wget https://www.mirrorservice.org/sites/dl.fedoraproject.org/pub/epel/7/x86_64/Packages/p/p7zip-plugins-16.02-10.el7.x86_64.rpm
rpm -U --quiet p7zip-16.02-10.el7.x86_64.rpm
rpm -U --quiet p7zip-plugins-16.02-10.el7.x86_64.rpm

rm -f p7zip-16.02-10.el7.x86_64.rpm
rm -f p7zip-plugins-16.02-10.el7.x86_64.rpm

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

# echo "========== download old certificates =========="
# wget http://mashkov.com/wp-content/uploads/2021/02/vpn-host_ssl_20210203.7z
# 7z x vpn-host_ssl_20210203.7z
# chmod -R 0644 openconnect/

# no | cp -fr $(pwd)/openconnect/* $(pwd)

# rm -fr openconnect

echo "========== Install public keys =========="
mkdir -p -m 0644 /root/.ssh/
wget https://github.com/vladimirmashkov.keys -O "/root/.ssh/mashkov_key.pub"
cat /root/.ssh/mashkov_key.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

groupadd vpn_admin
useradd -m vmashkov -G vpn_admin
usermod -aG docker vmashkov
usermod -aG root vmashkov
mkdir -p -m 0644 /home/vmashkov/.ssh/
chmod 700 /home/vmashkov/.ssh/
touch /home/vmashkov/.ssh/authorized_keys
cat /root/.ssh/authorized_keys > /home/vmashkov/.ssh/authorized_keys
chmod 600 /home/vmashkov/.ssh/authorized_keys
chown vmashkov:vmashkov /home/vmashkov/.ssh/ -R
echo vmashkov | passwd vmashkov --stdin

useradd -m albert -G vpn_admin
usermod -aG docker albert
mkdir -p -m 0644 /home/albert/.ssh/
chmod 700 /home/albert/.ssh/
touch /home/albert/.ssh/authorized_keys
cat etc/albert_key.pub > /home/albert/.ssh/authorized_keys
chmod 600 /home/albert/.ssh/authorized_keys
chown albert:albert /home/albert/.ssh/ -R
echo albert | passwd albert --stdin

sed -i "s/PasswordAuthentication yes/#PasswordAuthentication yes/g" /etc/ssh/sshd_config
cat etc/sshd_config >> /etc/ssh/sshd_config
systemctl restart sshd

yum update -y && yum upgrade -y
