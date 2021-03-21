#!/bin/bash
declare -a arr=(
    "cert_get_new.sh"
    "cert_renew.sh"
    "docker-compose.yml"
    "test.sh"
    "./nginx/conf.d/vpn-host.conf"
    "05.cp_and_clean-up.sh"
    "cert_get_new.sh"
    "cert_renew.sh"
    )
for i in "${arr[@]}"
do
   sed -i "s/<vpn_domain_name>/${vpn_domain_name}/g" $i
done

# touch /etc/systemd/system/docker-compose-ocserv.service
# printf  "# /etc/systemd/system/docker-compose-ocserv.service \n[Unit] \nDescription=Docker Compose Application Service Nginx + Ocserv (OpenConnect) \nRequires=docker.service \nAfter=docker.service \n
# [Service]\nType=oneshot\nRemainAfterExit=yes\nWorkingDirectory=$(pwd)\nExecStart=/usr/local/bin/docker-compose up -d\nExecStop=/usr/local/bin/docker-compose down\nTimeoutStartSec=20 \n
# [Install] \nWantedBy=multi-user.target\n" > /etc/systemd/system/docker-compose-ocserv.service

echo "* * 5,25 * * $(pwd)/cert_renew.sh" > crontab.txt
echo "* 3 * * * /usr/bin/systemctl restart docker" >> crontab.txt
crontab < crontab.txt

mkdir -p -m 0644 /var/openconnect_admin
cp openconnect_admin/* /var/openconnect_admin/
chmod +x -R /var/openconnect_admin
touch /var/openconnect_admin/vpn_log.txt
chmod 0666 /var/openconnect_admin/vpn_log.txt
export PATH="/var/openconnect_admin:$PATH"