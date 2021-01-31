# openconnect

yum install -y git <br/>
git clone https://github.com/vladimirmashkov/openconnect.git <br/>
cd openconnect/ <br/>

git checkout origin/dev/centos7 <br/>

sh 01.prepare_os.sh
sh 02.prepare_soft.sh
sh 03.install_soft.sh
sh 04.cp_and_clean-up.sh
sh 05.start_soft.sh

ocpasswd -c /etc/ocserv/passwd -g default my_login_name
