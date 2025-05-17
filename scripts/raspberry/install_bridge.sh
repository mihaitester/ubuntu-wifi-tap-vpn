# docs [ https://forums.raspberrypi.com/viewtopic.php?t=367559 ]
sudo apt-get install bridge-utils

# configure the bridge
# note: in case this does not work, edit or create the file manually and add the following lines
echo auto lo >> /etc/network/interfaces
echo iface lo inet loopback >> /etc/network/interfaces
echo >> /etc/network/interfaces
echo auto eth0 >> /etc/network/interfaces
echo iface eth0 inet manual >> /etc/network/interfaces
echo >> /etc/network/interfaces
echo auto eth1 >> /etc/network/interfaces
echo iface eth1 inet manual >> /etc/network/interfaces
echo >> /etc/network/interfaces
echo auto br0 >> /etc/network/interfaces
echo iface br0 inet dhcp >> /etc/network/interfaces
echo bridge_ports eth0 >> /etc/network/interfaces
echo bridge_ports eth1 >> /etc/network/interfaces
echo bridge_fd 9 >> /etc/network/interfaces
echo bridge_hello 2 >> /etc/network/interfaces
echo bridge_stp off >> /etc/network/interfaces

# block dhcp from eth0, eth1
# note: in case this does not work, edit or create the file manually and add the following lines
echo denyinterfaces eth0 eth1 >> /etc/dhcpcd.conf
echo interface br0 >> /etc/dhcpcd.conf