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

rem echo rename the interface below with the one that shows up in ipconfig, after sharing network connection
set "interface=Local Area Connection* 13"

"C:\Program Files\Wireshark\wireshark.exe" -k -i "%interface%" -b duration:%duration% -w wireshark_hotspot.capture --log-file "wireshark_hotspot_%starttime%.log"
pause