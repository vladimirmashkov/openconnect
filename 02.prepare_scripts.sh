#!/bin/bash
declare -a arr=(
    "cert_get_new.sh"
    "cert_renew.sh"
    "docker-compose.yml"
    "test.sh"
    "./nginx/conf.d/vpn-host.conf"
    )
for i in "${arr[@]}"
do
   sed -i "s/<vpn_domain_name>/${vpn_domain_name}/g" $i
done

echo "* * 5,25 * * $(pwd)/cert_renew.sh" > crontab.txt
crontab < crontab.txt

