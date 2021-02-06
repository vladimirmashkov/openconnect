# openconnect

```bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
path_vpn_domain_name = /etc/profile.d/vpn_domain_name.sh
echo "export vpn_domain_name=www0.music-tm.com" > $path_vpn_domain_name
echo "export PATH="/var/openconnect_admin:$PATH"" >> $path_vpn_domain_name
```
```bash
reboot
```
```bash
yum install -y git
git clone https://github.com/vladimirmashkov/openconnect.git
cd openconnect/
git checkout origin/dev/nginx_auto
git checkout dev/nginx_auto
```
```bash
sh main.sh
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
reboot
```
_shell helper_
```bash
git fetch && git stash && git pull

# ocpasswd -c /etc/ocserv/passwd -g default my_login_name 
docker exec -it ocserv ocpasswd -c /etc/ocserv/passwd -g default my_login_name

sh test.sh
```