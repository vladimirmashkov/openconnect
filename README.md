# openconnect

```bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
reboot
```
```bash
yum install -y git
git clone https://github.com/vladimirmashkov/openconnect.git
cd openconnect/
git checkout origin/dev/nginx
git checkout dev/nginx
```
```bash
echo "export vpn_domain_name=www0.music-tm.com" > vpn_domain_name.sh
```
```bash
sh 01.prepare_os.sh
reboot

cd openconnect/ 

sh 02.prepare_scripts.sh
sh 03.prepare_soft.sh
sh 04.install_soft.sh
sh 05.cp_and_clean-up.sh
sh 06.start_soft.sh
```

_shell helper_
```bash
git fetch && git stash && git pull


sh test.sh
```