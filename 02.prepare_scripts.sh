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

w_d=$(pwd)
sed -i "s/<w_d>/${w_d}/g" docker-compose-ocserv.service
cat docker-compose-ocserv.service > /etc/systemd/system/docker-compose-ocserv.service
# rm -f docker-compose-ocserv.service

echo "* * 5,25 * * $(pwd)/cert_renew.sh" > crontab.txt
echo "@reboot (sleep 30s ; cd /root/openconnect ; /usr/local/bin/docker-compose up -d )&" >> crontab.txt
crontab < crontab.txt

