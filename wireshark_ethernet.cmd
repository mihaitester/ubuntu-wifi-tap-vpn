set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

"C:\Program Files\Wireshark\wireshark.exe" -k -i Ethernet -b duration:1800 -w wireshark_ethernet.capture --log-file wireshark_ethernet_%starttime%.log
pause