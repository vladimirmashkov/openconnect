yum update -y && yum upgrade -y
yum install -y epel-release
timedatectl set-timezone Europe/Moscow
yum install -y --enablerepo=epel ntp ntpdate wget mc p7zip-full whois net-tools traceroute mtr sed
ntpdate -s time.nist.gov
cp -f "etc/resolv.conf" "/etc/resolv.conf"


yum install -y yum-utils
yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
yum install -y docker-ce docker-ce-cli containerd.io

curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose

yum update -y && yum upgrade -y