set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

rem record a status of the interfaces at the time of starting the scripts
ipconfig.exe /all >> "C:\Users\%USERNAME%\Desktop\ipconfig_%starttime%.txt"