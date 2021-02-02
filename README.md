# openconnect

```bash
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config
reboot
```
```bash
yum install -y git
git clone https://github.com/vladimirmashkov/openconnect.git
cd openconnect/
git checkout origin/dev/docker_certbot_nginx
```
```bash
export domain_name=www0.music-tm.com
```
```bash
sh 01.prepare_os.sh

./init-letsencrypt.sh

```
