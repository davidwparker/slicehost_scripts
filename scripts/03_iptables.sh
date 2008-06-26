#03_iptables
#iptables
cd ~
iptables-save > /etc/iptables.up.rules
mv slicehost_scripts/config/iptables.txt /etc/iptables.test.rules
iptables-save > /etc/iptables.up.rules
#nano /etc/network/interfaces
#add the following after iface lo inet loopback
#pre-up iptables-restore < /etc/iptables.up.restore
mv slicehost_scripts/config/interfaces.txt /etc/network/interfaces
/etc/init.d/ssh reload
