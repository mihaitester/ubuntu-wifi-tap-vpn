set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

"C:\Program Files\Wireshark\wireshark.exe" -k -i WiFi -b duration:1800 -w wireshark_wifi.capture --log-file wireshark_wifi_%starttime%.log
pause