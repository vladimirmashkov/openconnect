# openconnect
```bash
docker-compose down
rm -f docker-compose.yaml
rm -f vladimir_key.pub
hostnamectl set-hostname the_domain

echo
echo "nameserver 8.8.8.8" > /etc/resolv.conf
echo "nameserver 8.8.4.4" >> /etc/resolv.conf
echo
```

```bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
path_vpn_domain_name=/etc/profile.d/vpn_domain_name.sh
echo "export vpn_domain_name=the_domain" > $path_vpn_domain_name
echo "export PATH="/var/openconnect_admin:$PATH"" >> $path_vpn_domain_name
reboot
echo
```
```bash
yum install -y git
git clone https://github.com/vladimirmashkov/openconnect.git
cd openconnect/
git checkout origin/dev/nginx_auto
git checkout dev/nginx_auto
sh main.sh
sh cert_get_new.sh
echo
```
_or_
```bash
sh 01.prepare_os.sh
sh 02.prepare_scripts.sh
sh 03.prepare_soft.sh
sh 04.install_soft.sh
sh 05.cp_and_clean-up.sh
sh 06.start_soft.sh
```
```bash
systemctl restart docker
```
```bash
sh cert_get_new.sh
```
```bash
reboot
```
_shell helper_
```bash
git fetch && git stash && git pull

# ocpasswd -c /etc/ocserv/passwd -g default my_login_name 
docker exec -it ocserv ocpasswd -c /etc/ocserv/passwd -g default my_login_name

sh test.sh
```

```bash
curl -O "https://raw.githubusercontent.com/vladimirmashkov/openconnect/dev/nginx_auto/00.prepare_os_check.sh"
chmod 0777 00.prepare_os_check.sh
./00.prepare_os_check.sh

echo

```

with ssh_key
```bash
curl -O "https://raw.githubusercontent.com/vladimirmashkov/openconnect/dev/nginx_auto/etc/vladimir_key.pub"
curl -O "https://raw.githubusercontent.com/vladimirmashkov/openconnect/dev/nginx_auto/00.prepare_os_check_ssh.sh"
chmod 0777 00.prepare_os_check_ssh.sh
./00.prepare_os_check.sh

echo

```
