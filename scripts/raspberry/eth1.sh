duration=1800
if [ "$1" != "" ]; then
	duration=$1
fi
dt=$(date +"%Y-%m-%d_%H-%M-%S")
wireshark -k -i eth1 -b duration:${duration} -w eth1.capture --log-file eth1_${dt}.log
