set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

set duration=1800
if [%1] != [] (
    if %1 GTR 0 (
        set "duration=%1"
    )
)

rem echo rename the interface below with the one that shows up in ipconfig, verify the name for the wifi interface
set "interface=WiFi"

"C:\Program Files\Wireshark\wireshark.exe" -k -i "%interface%" -b duration:%duration% -w wireshark_wifi.capture --log-file wireshark_wifi_%starttime%.log
pause