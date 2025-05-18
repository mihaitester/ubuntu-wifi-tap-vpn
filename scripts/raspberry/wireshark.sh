echo Observed that its better to use shorter duration values \(\<900\) capture files for raspberrypi, that is memory limited to 1Gb RAM
duration=300
if [ "$1" != "" ]; then
	duration=$1
fi
echo duration=${duration}

bash -c ./eth0.sh $duration &
bash -c ./eth1.sh $duration &
bash -c ./br0.sh $duration &

# note: observed weird packets on loopback interface before getting hacked
bash -c ./lo.sh $duration &
