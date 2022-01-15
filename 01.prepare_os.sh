#!/bin/bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
apt upgrade -y && apt update -y 
timedatectl set-timezone Europe/Moscow
apt install -y \
    ntp ntpdate \
    wget mc whois \
    net-tools traceroute mtr sed \
    p7zip-full perl unzip net-tools python3 pip \
    ca-certificates \
    curl \
    gnupg \
    lsb-release

#apt install -y iptables-services wget perl unzip net-tools perl-libwww-perl perl-LWP-Protocol-https perl-GDGraph
cat "etc/resolv.conf" > "/etc/resolv.conf"
ntpdate -s time.nist.gov

echo "========== Install Docker =========="
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
apt install -y docker-ce docker-ce-cli containerd.io

echo "========== Install Docker Compose =========="
curl -L "https://github.com/docker/compose/releases/download/1.28.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
systemctl start docker
systemctl enable docker

wget -c https://mashkov.com/soft/anyconnect-macos-4.9.06037-predeploy-k9.7z -P nginx/www/vpn-host/www/soft/ && \
wget -c https://mashkov.com/soft/anyconnect-linux64-4.9.06037-webdeploy-k9.7z -P nginx/www/vpn-host/www/soft/ && \
wget -c https://mashkov.com/soft/anyconnect-win-4.9.06037-core-vpn-predeploy-k9.7z  -P nginx/www/vpn-host/www/soft/ 

echo "========== Install public keys =========="
mkdir -p -m 0644 /root/.ssh/
wget https://github.com/vladimirmashkov.keys -O "/root/.ssh/mashkov_key.pub"
wget https://github.com/dev-vladimirmashkov.keys -O "/root/.ssh/vmashkov_key.pub"
cat /root/.ssh/mashkov_key.pub > /root/.ssh/authorized_keys
cat /root/.ssh/vmashkov_key.pub >> /root/.ssh/authorized_keys
chmod 600 /root/.ssh/authorized_keys

groupadd vpn_admin

chmod 0640 /etc/sudoers 
echo "%sudo  ALL=(ALL)       NOPASSWD: ALL" >> /etc/sudoers 
chmod 0440 /etc/sudoers 
useradd -m vmashkov -G root 
usermod -aG wheel vmashkov 
usermod -aG root vmashkov
usermod -aG docker vmashkov 
usermod -aG vpn_admin vmashkov
mkdir -p -m 0644 /home/vmashkov/.ssh/
chmod 700 /home/vmashkov/.ssh/
touch /home/vmashkov/.ssh/authorized_keys
touch /home/vmashkov/.Xauthority
cat /root/.ssh/authorized_keys > /home/vmashkov/.ssh/authorized_keys
chmod 600 /home/vmashkov/.ssh/authorized_keys
chown vmashkov:vmashkov /home/vmashkov/.ssh/ -R
echo "vmashkov:vmashkov" | chpasswd

useradd -m ocserv -G vpn_admin
usermod -aG docker ocserv
mkdir -p -m 0644 /home/ocserv/.ssh/
chmod 700 /home/ocserv/.ssh/
touch /home/ocserv/.ssh/authorized_keys
touch /home/ocserv/.Xauthority
cat /root/.ssh/authorized_keys > /home/ocserv/.ssh/authorized_keys
chmod 600 /home/albert/.ssh/authorized_keys
chown ocserv:ocserv /home/ocserv/.ssh/ -R
echo "ocserv:ocserv" | chpasswd

useradd -m albert -G vpn_admin
usermod -aG docker albert
mkdir -p -m 0644 /home/albert/.ssh/
chmod 700 /home/albert/.ssh/
touch /home/albert/.ssh/authorized_keys
touch /home/albert/.Xauthority
cat etc/albert_key.pub > /home/albert/.ssh/authorized_keys
chmod 600 /home/albert/.ssh/authorized_keys
chown albert:albert /home/albert/.ssh/ -R
echo "albert:albert" | chpasswd

sed -i "s/PasswordAuthentication yes/#PasswordAuthentication yes/g" /etc/ssh/sshd_config
cat etc/sshd_config >> /etc/ssh/sshd_config
systemctl restart sshd
apt upgrade -y && apt update -y 

cd ..
mv openconnect /home/ocserv/
reboot

