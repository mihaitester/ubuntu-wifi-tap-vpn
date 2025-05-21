start cmd.exe /c ifconfig.cmd

rem note: https://stackoverflow.com/questions/2541767/what-is-the-proper-way-to-test-if-a-parameter-is-empty-in-a-batch-file

set duration=1800
if [%1] != [] (
    if %1 GTR 0 (
        set "duration=%1"
    )
)

rem start cmd.exe /c wireshark_wifi.cmd %duration%
start cmd.exe /c wireshark_ethernet.cmd %duration%

rem observed weird packets through loopback interface right before getting hackedw
start cmd.exe /c wireshark_loopback.cmd %duration%

rem trying to link the processes running on client OS to the packets running through the network
start cmd.exe /c netstat_tasklist.cmd %duration%