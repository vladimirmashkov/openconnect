# openconnect
sed -i "s/SELINUX=permissive/SELINUX=disabled/g" /etc/selinux/config <br/>
reboot <br/>

yum install -y git <br/>
git clone https://github.com/vladimirmashkov/openconnect.git <br/>
cd openconnect/ <br/>

git checkout origin/dev/centos7_ssl_admin <br/>

export domain_name=www0.music-tm.com <br/>

sh 01.prepare_os.sh <br/>
sh 02.prepare_soft.sh <br/>
sh 03.install_soft.sh <br/>
sh 04.cp_and_clean-up.sh <br/>
sh 05.start_soft.sh <br/>
reboot <br/>

ocpasswd -c /etc/ocserv/passwd -g default my_login_name <br/>
