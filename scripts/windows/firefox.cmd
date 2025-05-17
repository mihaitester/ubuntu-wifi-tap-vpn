taskkill /f /im firefox.exe
cd "C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox"

rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC /d "C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox" firefox.exe
rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC firefox.exe
rem echo Firefox closed its parent process !!!
rem start /w /affinity 0xC cmd.exe /c "firefox.exe"
rem both powershell and cmd are dangerous parent processes
rem this does not work, hence need powershell holder
rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC cmd.exe /k "cmd.exe /k firefox.exe "
rem powershell "Start-Process -Wait -FilePath 'C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox\firefox.exe'"

start "firefox-parent-process-exploit-blocker" /w /affinity 0xC cmd.exe /c "powershell "Start-Process -Wait -FilePath 'C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox\firefox.exe'" "
pause