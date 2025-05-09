taskkill /f /im chrome.exe
cd C:\Users\%USERNAME%\AppData\Local\Google\Chrome\Application
rem start /w /low /affinity 0xF0 chrome.exe
rem start /w /low chrome.exe
start /w /affinity 0xF0 chrome.exe
pause