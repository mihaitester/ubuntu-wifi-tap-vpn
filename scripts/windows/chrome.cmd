taskkill /f /im chrome.exe

rem note: for affinity setting to work, need to enable all processors [number_of_processors=8] in msconfig.msc [ https://www.reddit.com/r/Windows10/comments/qys8ob/any_idea_if_changing_the_number_of_processors/ ]
rem note: for affinity setting to work, need to have user freshly logged into session, otherwise running explorer.exe under affinity settings will block child processes from accessing different procesors than parent
rem note: affinity mask is basically the bitmask in hex, use calculator in programmer mode, with binary view to get the mask easier

cd C:\Users\%USERNAME%\AppData\Local\Google\Chrome\Application
rem start /w /low /affinity 0xF0 chrome.exe
rem start /w /low chrome.exe
start /w /affinity 0xF0 chrome.exe
pause