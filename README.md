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
sh 02.prepare_scripts.sh
```

_shell helper_
```bash
git fetch && git stash && git pull

sh test.sh
```