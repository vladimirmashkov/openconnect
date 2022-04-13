###!/bin/bash
echo "nameserver 8.8.8.8" >  /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf


yum update -y && yum upgrade -y
yum install -y epel-release && \
timedatectl set-timezone Europe/Moscow
yum install -y --enablerepo=epel ntp ntpdate wget mc whois net-tools traceroute mtr sed tree
yum -y install --enablerepo=epel iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph
ntpdate -s time.nist.gov

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


mkdir -p -m 0644 /root/.ssh/
chmod 700 /root/.ssh/
touch /root/.ssh/authorized_keys
cat vladimir_key.pub > /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

sed -i "s/PasswordAuthentication yes/PasswordAuthentication no/g" /etc/ssh/sshd_config

yum update -y && yum upgrade -y


echo "version: '3.8'" > docker-compose.yaml
echo "services:" >> docker-compose.yaml
echo "  nginx:" >> docker-compose.yaml
echo "    image: nginx:latest" >> docker-compose.yaml
echo "    restart: always" >> docker-compose.yaml
echo "    container_name: nginx" >> docker-compose.yaml
echo "    ports:" >> docker-compose.yaml
echo "      - \"80:80\"" >> docker-compose.yaml
echo "      - \"443:443\"" >> docker-compose.yaml

systemctl stop docker
systemctl start docker

docker-compose up -d

