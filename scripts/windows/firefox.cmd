taskkill /f /im firefox.exe
cd "C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox"

rem note: for affinity setting to work, need to enable all processors [number_of_processors=8] in msconfig.msc [ https://www.reddit.com/r/Windows10/comments/qys8ob/any_idea_if_changing_the_number_of_processors/ ]
rem note: for affinity setting to work, need to have user freshly logged into session, otherwise running explorer.exe under affinity settings will block child processes from accessing different procesors than parent
rem note: affinity mask is basically the bitmask in hex, use calculator in programmer mode, with binary view to get the mask easier

rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC /d "C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox" firefox.exe
rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC firefox.exe
rem echo Firefox closed its parent process !!!
rem start /w /affinity 0xC cmd.exe /c "firefox.exe"
rem both powershell and cmd are dangerous parent processes
rem this does not work, hence need powershell holder
rem start "firefox-parent-process-exploit-blocker" /w /affinity 0xC cmd.exe /k "cmd.exe /k firefox.exe "
rem powershell "Start-Process -Wait -FilePath 'C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox\firefox.exe'"

start "firefox-parent-process-exploit-blocker" /w /affinity 0xC cmd.exe /c "powershell.exe \"Start-Process -Wait -FilePath 'C:\Users\%USERNAME%\AppData\Local\Mozilla Firefox\firefox.exe'\" "
pause