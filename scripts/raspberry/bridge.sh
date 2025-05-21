#!/bin/bash
if ! [ $(id -u) = 0 ]; then
   echo "This script must be run as root or with sudo!"
   exit 1
fi

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

# record the status of the configuration to a file
dt=$(date +"%Y-%m-%d_%H-%M-%S")
ifconfig >> ifconfig_${dt}.txt
