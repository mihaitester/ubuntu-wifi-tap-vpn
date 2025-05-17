duration=1800
if [ "$1" != "" ]; then
	duration=$1
fi
dt=$(date +"%Y-%m-%d_%H-%M-%S")
wireshark -k -i br0 -b duration:${duration} -w br0.capture --log-file br0_${dt}.log
