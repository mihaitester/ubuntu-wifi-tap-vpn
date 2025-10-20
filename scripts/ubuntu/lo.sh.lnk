duration=1800
if [ "$1" != "" ]; then
	duration=$1
fi
dt=$(date +"%Y-%m-%d_%H-%M-%S")
wireshark -k -i lo -b duration:${duration} -w lo.capture --log-file lo_${dt}.log
