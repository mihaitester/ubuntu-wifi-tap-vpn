rem @echo off
rem need the echo off so that console does not fill with text

:bigloop
set starttime=%date%_%time%
set "starttime=%starttime:/=-%"
set "starttime=%starttime::=-%"
set "starttime=%starttime: =_%"
echo %starttime%

set timeout=5
set looptime=1800
set /a loopcount=%looptime% / %timeout%
echo %loopcount%

:loop
set datetime=%date%_%time%
set "datetime=%datetime:/=-%"
set "datetime=%datetime::=-%"
set "datetime=%datetime: =_%"
rem why does this spam files, makes me think not just of rootkitted OS, but of fake VM os running
rem so having %datetime% instead of %date_time% fixes the issue, means CMD parser is broken

echo %datetime% >> "netstat_%starttime%.txt"
netstat.exe -nao >> "netstat_%starttime%.txt"
rem this requires administrator priviledges
rem netstat -naob >> "netstat_%starttime%.txt"
echo %datetime% >> "tasklist_%starttime%.txt"
tasklist.exe >> "tasklist_%starttime%.txt"

rem having script with same name as command hijacks the command
timeout /t 5 /nobreak
rem need the cls to stop the console from filling
cls

rem now we need to keep printing this in a loop, so that it can be correlated with wireshark logs
rem [ https://stackoverflow.com/questions/17584282/how-to-check-if-a-parameter-or-variable-is-a-number-in-a-batch-script ] => handling numerical variables
if %loopcount% GTR 0 (
	set /a loopcount=%loopcount% - 1
	goto :loop
) else (
	echo Finished running script
	goto :bigloop
)

pause