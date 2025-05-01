set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

set "interface=Adapter for loopback traffic capture"

"C:\Program Files\Wireshark\wireshark.exe" -k -i "%interface%" -b duration:1800 -w "wireshark_%interface%.capture" --log-file "wireshark_%interface%_%starttime%.log"
pause