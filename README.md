# openconnect
```bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
reboot
```
```bash
yum install -y git
git clone https://github.com/vladimirmashkov/openconnect.git
cd openconnect/
git checkout origin/dev/centos7_ssl_admin
```
```bash
export domain_name=www0.music-tm.com
```
```bash
sh 01.prepare_os.sh
sh 02.prepare_soft.sh
sh 03.install_soft.sh
sh 04.cp_and_clean-up.sh
sh 05.start_soft.sh
```
```bash
reboot
```
```bash
ocpasswd -c /etc/ocserv/passwd -g default my_login_name
```