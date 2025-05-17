if [ $1 != "" ]; then
	nmcli connection modify $1 802-11-wireless.band a
else
	echo "Provide a connection to set to 5G. Use [ nmcli connection ] to see available options"
fi
