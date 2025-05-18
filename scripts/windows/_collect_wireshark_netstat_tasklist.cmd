start cmd.exe /c ifconfig.cmd

rem start cmd.exe /c wireshark_wifi.cmd
start cmd.exe /c wireshark_ethernet.cmd

rem observed weird packets through loopback interface right before getting hackedw
start cmd.exe /c wireshark_loopback.cmd

rem trying to link the processes running on client OS to the packets running through the network
start cmd.exe /c netstat_tasklist.cmd