rm -rf /opt/csf &
rm -rf /opt/csf.tgz &

yes | cp -rf etc/csfpre.sh /etc/csf/csfpre.sh

yes | cp -rf etc/sysctl.conf /etc/sysctl.conf

chmod 0644 /etc/csf/csfpre.sh
chmod 0644 /etc/sysctl.conf

