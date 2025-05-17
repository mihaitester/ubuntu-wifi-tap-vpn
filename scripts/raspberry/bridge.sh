echo this requires sudo 

# stop interfaces
ifconfig eth0 down
ifconfig eth1 down

# reconfigure the bridge
brctl addbr br0
brctl addif br0 eth0
brctl addif br0 eth1
brctl show

# restart the interfaces
ifconfig eth0 up
ifconfig eth1 up
ifconfig br0 up
ifconfig
