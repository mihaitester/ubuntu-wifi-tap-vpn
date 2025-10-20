duration=1800
if [ "$1" != "" ]; then
	duration=$1
fi
dt=$(date +"%Y-%m-%d_%H-%M-%S")
wireshark -k -i eth0 -b duration:${duration} -w eth0.capture --log-file eth0_${dt}.log

