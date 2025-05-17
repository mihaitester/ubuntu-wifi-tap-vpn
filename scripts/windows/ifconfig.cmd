set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

ipconfig.exe /all >> "C:\Users\%USERNAME%\Desktop\ipconfig_%starttime%.txt"