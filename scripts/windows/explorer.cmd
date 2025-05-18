taskkill /f /im explorer.exe

rem note: for affinity setting to work, need to enable all processors [number_of_processors=8] in msconfig.msc [ https://www.reddit.com/r/Windows10/comments/qys8ob/any_idea_if_changing_the_number_of_processors/ ]
rem note: for affinity setting to work, need to have user freshly logged into session, otherwise running explorer.exe under affinity settings will block child processes from accessing different procesors than parent
rem note: affinity mask is basically the bitmask in hex, use calculator in programmer mode, with binary view to get the mask easier

rem observation: doing this blocks the desktop viewer and the taskbar
rem start /w /low /affinity 0x2 explorer.exe "C:\users\%USERNAME%\Desktop"

rem note: all child processes or everything else that user starts afterwards will have this bitmask applied
rem observation: so doing this restarts explorer and desktop viewer
start /w /low /affinity 0x2 explorer.exe
rem explorer.exe "C:\users\%USERNAME%\Desktop"