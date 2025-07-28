# Summary of research
Based on my current research on my identity theft and assuming rootkitted devices, if we do not meet in person its not me who you are meeting.
- I live in `Romania, Bistrita-Nasaud, Bistrita, Strada Poienii nr.10.`
- If you get phone calls from me or weird emails requesting money or personal details then its not me. 
- If you meet me at any other location, then its not me.
- I am using landline internet connection, but if you check my github you will see more details.
- If you can get me an IT job, then help me escape this panopticon.
- I had an Apple account with my email, which I lost access to in Dubai in 2020, hence its not me.
- My current OS windows 10 is rootkitted, some else sees what I am doing on my laptop, its like a fake VM with lots of weird bugs in the GUI.
- I am 100% sure Romanian Secret Services are involved in my identity theft.
   - I am 100% sure I have more than 1 clone pretending to be me, maybe there are more actors involved
      - 1 similar physical appearance
      - 1 digital footprint and hijacking

## Posibility of identity theft
- When filling in forms with name, for example when filling in paperwork for ID card, people can steal name and have similar name, enabling them to pretend to be you
   - ID cards start being released when reaching 14 years old with 4 years in between cards or 10 years between cards afterwards
   - 1992 - born date
   - 2006 - first card (14)
      - people standing by could have snooped over the name and stolen the same name
   - 2010 - second card (18)
   - 2017 - third card (25)
      - this time I came in alone with pre-filled in documents as required
      - notice the unexplained offset - not 4 years or 10 years

## Keep paper copies of these, as the person office takes the previous card when submitting for new card
- Companies that I previously worked for have multiple details not just home address, ID cards, passports, SIM cards phone numbers, email addresses
   - but with a spoofed wifi or hijacked ethernet and with spoofed GSM tower - people can literally disappear
- Need to proove identity from childhood to present
   - including time before reaching 14 years old

## Anti-theft of ID - use phones only when needed, the fewer the better
   - never sell phones on second hand market
      - be mindful when buying new phones where do they come from
         - which countries they come from
         - which countries you use them in
   - never throw away phone SIM cards
      - be mindful of which phone carriers you use and where
   - never throw away HDDs or SSDs
      - data can be recovered and stolen even if the disks are wiped

## Security recommendations based on observations
- Disable `auto-updates` for laptop and phones, and `auto-connect` to WiFi as hackers use these 2 to enter systems, change apps, and then leave the system without leaving trace of their hacking. These are the only 2 measures that can delay or block some intrusions, however for `RF` hacking the only solution is to increase distance, or not leave systems turned on when not in use.
   - always be mindful of the place where connecting to `WiFi` and updating apps, never do it from `mobile network` or from `wifi` from public places 
      - ideally always use hardline when doing updates
   - never use banking app phones connected to `WiFi` 
   - get `usb-ethernet adapter` and `USB3 to USB-C adapter` for phone when connecting to banking apps
   - `SMS` alerts are not enough for `2FA`, as you can see in the `Netflix series Mr. Robot`, GSM towers can be faked and one time codes can be intercepted
   - in case OS system is rootkitted than cannot do anything substantially, all passwords stolen, can only request bank to disable online banking and phone apps and rely on bank office for transfers, which greatly delays everything
      - greater problem is identity theft, which can enable hackers to do serious damage by impersonation of people

- Resetting phone and laptop is pointless
   - recommend getting new phone, new sim card, new laptop
      - start the devices at different location that is not `RF` bombarded
      - disable `auto-updates` or on first connect getting malwared through `man in the middle` attacks
   
- Always turn off devices when not in use
   - otherwise the devices get used by hackers
   - remove batteries
   - unplug power
   - unplug ethernet and coaxial cables
   - cannot unplug copper pipes, hence use PVC pipes instead

- Generic advice
   - turn master electrical power off, gas and water valves
      - to avoid damage to property in case of leaks or induced short-circuits through microwaves

- Having different provider for different services can help avoid some backdoors that work with different devices, but increases privacy exposure to multiple operators and increases costs
   - TV 
   - internet
   - mobile
      - ideally turn off all devices when not in use
      - ideally use only a device at a time, removing possibility for cross-service backdoor communications

# Usage
- if scripts do not work install the required components and check the paths are set accordingly
- see `Diagram 7` to get overview of how the scripts are getting used

1. On the raspberrypi
   - turn on first, before laptop and modem
   - then running the `sudo ./bridge.sh` command
   - run the `./wireshark.sh` command
2. On the client laptop
   - connect first the ethernet-USB adapter, then plug in the ethernet cable after a few seconds
      - this ensures the USB device is identified as ethernet adapter and not keyboard/mouse
   - run the `_collect_wireshark_netstat_tasklist.cmd` after logging in
3. Power on the ISP modem and wait for the packets to start comming.

# Idea
After getting hacked multiple times, through various means, decided to create a mini tap using a mini computer such as `raspberry pi` and `wireshark`.

0. It would be impossible to detect `snooping hacker` which just listens passively to `wifi` packets - can only reduce the area of `wifi` signal by configuring all devices to emit low power, drastically reducing range of wifi to a couple of meters.
1. Idea would be to track `man in the middle` attacks done over the wifi network and block with a custom firewall the attacks. 
2. Also such a mini tap could help find out if the client operating system is `rootkitted`.
3. From experience ISP modem / router device could be `hijacked and controlled remotely by ISP`, hence the idea is to block attempts of hacking from Modem / Router.
4. Adding `firewalls` to the inner network and the outer network.
5. Adding `VPN layer` so that all packets leaving through ISP are encrypted. However this will require another computer to be set up as VPN server.
   - see `Diagram 2`
6. Trying to detect `hijacking` of laptop through `RF emissions`, as observed, basically devices passing by connecting to a laptop without being paired or approved. From observation, CPU or RAM memory seems to be susceptible to such manipulations, or there are other on board devices which can receive foreign signals and activate backdoors.
7. As far as I know, there is no protection from electrical current variation, or from power-adapter that may have replaced components. I think this can also be used to hijack device. 
   - `USB to ethernet adapter` or `power plug adapter` can get fuzzed signals that if not cleaned can cause devices to be hijacked.
   - all device accessories can contain hidden `WIFI` that can enable remote access

* Using windows commands such as `netstat` and `tasklist`, to be able to backtrack which processes were holding open which connections and ports. Ideally this would be done instead using some windows driver written in C as that would be more reliable.

# Diagram 1
                                       [5]
                                        .
                        [4]             .                 [4]
    Client laptop        .              .                  .        ISP Modem / Router
     ________            .       Mini computer tap         .               __
    |        |           .           ________              .              |  |
    |________|-----(   WIFI   )-----|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/           |                                                |__|
         .               |                                                  .
         .               |                                                  .
         .            ___|____                                              .
        [2]          |        |                                            [3]
                     |________|
                     \________\

             Snooping / Hijacking Hacker
                            .
                            .
                            .
                           [1]

# Diagram 2
                                 Another ISP Modem / Router
                                           __                            Another mini computer
                                          |  |                                ________
      ====[   Coaxial landline   ]========|  |=======[   ETH cable   ]=======|________|
                                          |__|                                    .
                                                                                  .
                                                                                  .
                                                                                 [5]

# Diagram 3

    Client laptop                                ISP Modem / Router
     ________                                          __
    |        |                                        |  |
    |________|---[usb-eth]=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/      .                                 |__|
         .          .                                  .
         .          .                                  .
         .         [7]                                 .
        [2]                                           [3]

# Diagram 4
                                              [5]
                                               .
                         [4]                   .                [4]
    Client laptop         .                    .                 .        ISP Modem / Router
     ________             .           Mini computer tap          .               __
    |        |            .                ________              .              |  |
    |________|=====[   ETH cable   ]======|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/                                                                  |__|
         .                                                                       .
         .                                                                       .
         .                                                                       .
        [2]                                                                     [3]

# Diagram 5

    Hijacking Hacker           Client laptop                       ISP Modem 
       ________                  ________                              __
      |        |                |        |                            |  |
      |________|----(  RF  )----|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
      \________\       .        /________/                            |__|
                       .             .                                  .
                       .             .                                  .
                      [6]            .                                  .
                                    [2]                                [3]

# Diagram 6
                                             [3]
                                              .
                                              .
                                              .
     Client laptop                       ISP Modem 
       ________                              __
      |        |                            |  |
      |________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
      /________/                            |__|
            .                                 |
            .                                (RF)
            .                             ____|____
           [2]                           |         |
                                         |_________|
                                          \_________\

                                         Hijacking Hacker
                                                .
                                                .
                                                .
                                               [6]

# Diagram 7
                                                                    [5]
                                                                     .
                                     [4]                             .                [4]
    Client laptop                     .                              .                 .        ISP Modem / Router
     ________                         .                     Mini computer tap          .               __
    |        |                        .                          ________              .              |  |
    |________|--[usb-eth]=====[   ETH cable   ]======[usb-eth]--|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/      .                                   .                                             |__|
         .          .                                   .                                               .
         .          .                                   .                                               .
         .         [7]                                 [7]                                              .
        [2]                                                                                            [3]

# Diagram 8 - planted device wall - wall socket - light switch - light bulb - electrical wall dose - electrical safety switch - modified power strip
                                                            ( can literally be anything connected to electrical wire )
                                                                                        [7]
    Client laptop                                                                        .
     ________                                                                            .
    |        |                                                                           .
    |________|----[power-adapter 19V DC]=====[electrical-socket 220V AC]=====[hidden tapping device]
    /________/

# Diagram 9 - planted device power adapter

    ( can be replaced with similar looking device - or can have hidden wifi attached )
                          [7]
    Client laptop          .
     ________              .
    |        |             .
    |________|----[power-adapter 19V DC]=====[electrical-socket 220V AC]
    /________/
         .
         .
         .
        [2]

# Diagram 10 - TV and ISP modem hacked - coaxial cable frequency change or frequency tapping
   
    (got network changed error in browser after turning on TV)
    (turned both WIFI off - getting 0 RF)
             TV
     __________________
    |                  |
    |                  |
    |                  |
    |__________________|======[   Coaxial cable   ]=======\\
      /\            /\                                     \\
                                                            \\
                                                             \\
                                                         [Splitter]=======[   Coaxial landline   ]==========
                  ISP Modem                                  //
                     __                                     //
                    |  |                                   //
                    |  |======[   Coaxial cable   ]=======//
                    |__|
                     .
                     .
                     .
                    [3]


# Requirements
1. 1 X mini computer / raspberry pi
2. 1 X sdcard 32GB [ write ubuntu ISO ]
3. 2 X ethernet cables
4. 1 / 2 X ethernet adapters to USB - depending if client laptop has RJ45 plug or not
   ## Optional
   1. 1 X mini computer / raspberry pi - for configuring WiFi, or for VPN
   2. 1 X sdcard 32GB
   3. 1 X ethernet cable
   4. 1 X ethernet adapter to USB - if using secondary raspberrypi for WiFi
   5. 1 X dual band USB WiFi adapter - if using secondary raspberrypi for WiFi
   6. 1 X external HDD to collect logs

# Install from Windows
1. Download Ubuntu linux [ https://ubuntu.com/download/raspberry-pi ]
2. Download Rufus [ https://rufus.ie/en/#google_vignette ]
3. Write Ubuntu ISO to USB flashdisk [ https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#5-write-the-iso ]
4. Install sdcard inside raspberry pi

# Install from Linux
1. Use Gparted to format USB flashdisk [ 1 Ext4 partition + 1 Swap partition ]
2. Use DD to write Ubuntu ISO to USB flashdisk [ https://linuxconfig.org/burning-cds-over-the-internet-with-or-without-iso-image ]
3. Install sdcard inside raspberry pi

# Windows commands
1. `netstat -nao` - list processes and ports they are using
   - `netstat -naob` - requires administrator access
2. `tasklist` - list processes running currently
3. `wireshark` - capture from interface and rotate file based on duration

# Important notes
1. `TP_Link_1718` - someone in proximity to my location is actively hacking me and cloning my WIFI configurations
   - he makes some sort of clone network with same SSID which then spoofs my password when my laptop or my phone tries to connect to the legit network
   - I have tried using `5GHz` and `WPA3` - security but he is actively jamming those attempts, forcing me to either use `2Ghz` or `WPA/WPA2` password encryption which makes me think those are hackable
   - tried using low power settings on all devices, which should make them invisible outside of building and fenced property, yet I still get hacked when using `wifi`
      - this means hacking device has to be inside property or that some relay is used inside property
      - see `Diagram 1`
      - #Thanks neighbours

2. After getting powned through `Wifi`, decided to drop altogether the wifi trap and to move directly to cable, and disable `Wifi` on computer and on modem. 
   - see `Diagram 3`
3. Now the only thing left is to figure out how to detect if the OS client is `rootkitted`. Another idea would be to add a cable trap, so that ISP hijacking can be captured.
   - see `Diagram 4`

4. Physically removed `wifi card` from client laptop, to disable client laptop from being able to get backdoored via custom NIC exploit.
5. Weird `RF emissions` from laptop stopped after unplugging the speakers and subwoofer from motherboard.
6. Confirmed nothing from the laptop is emitting RF. Moved further away from outer wall to avoid envelope of emission from neigbouring buildings.
   - see `Diagram 5`
      - got readings of over `8 mW/m2` inside my house near the wall, which is like smartphone connecting to cell towers during a call, hence highly recommend anyone to buy themselves a `EF/MF/RF detector`
      - started observing that after couple of hours the `RF emission` follows my location inside the house hence need to get updated readings and move around
   - see `Diagram 6`
      - wifi emissions of ISP router disabled, no `2.4Ghz`, `5Ghz` or `Guest` networks enabled
      - getting lagging internet connection, and on wireshark lots of `[TCP retransmission]` packets, which sometimes causes laptop to run super slower

7. If opening `firefox.exe` regularly, then over time the `wireshark.exe` capture laggs behind and gets delayed `10min - 30min` or even more. While processor is limited I do not think its normal for this to happen, because when using just `chrome.exe` the same behaviour does not happen. Attached scripts that limit processor access of the browsers to avoid hidden exploits triggering `explorer.exe` on file download.

8. Removed the `HDD` after observed its getting randomly turned on when connecting `power plug` or `ethernet cable`.

9. Observed the laptop is emitting `RF` signal from around the `SSD` area, so far disconnected `speakers`, `HDD`, `Wifi card` and disabled Nvidia graphic card. So the only things that could emit are the `motherboard`, `CPU`, `SSD`.
   - Wall:
      - Neighbouring wall constantly emits `RF` fluctuating `1-2mW/m2`, even if laptop is turned off or unplugged from ethernet and power cable.
      - If not connected to ethernet or to power plug, laptop does not emit, which causes neighbouring wall to stop emitting over `2mW/m2`.
   - Laptop:
      - If increasing distance from neighbouring wall, then laptop emissions stop.
      - If removing power plug getting reduced `RF` readings from `8mW/m2` to `2.5mW/m2`
      - If connecting `power plug` to laptop, but sitting between laptop and wall, then getting `MF` readings fluctuating `0.1-0.2μT` from `SSD` area, with `cooling fans` and `HDD` disconnected from motherboard
      
      - `!!!` If connecting `power plug` or `ethernet cable` laptop starts emitting `RF` `!!!`
   
10. During hacking there is a sudden lag on the client laptop, in youtube streams for example, then client returns to normal, but the raspberrypi capture gets delayed and stops working, however internet connection does not experience further delays. This is weird, its like not being connected to ISP modem through the ethernet raspberry tap. Resetting raspberrypi tap breaks the network connection.
   - this is why I am suspecting power plug is involved into the hacking of the devices
   - the only other explanation is actively getting hacked through RF from outside sources, but the only readings are near the neighbouring wall, and raspberrypi is not in range of those readings

11. Observed most of the misbehaviour is while running `firefox.exe` hence had the idea to sepparate the process by limiting it to specific computer cores, so that exploits which escape from process by crashing `firefox.exe` and then a secondary `explorer.exe` spawns.
Using the scripts provided `[ /scripts/windows ]` helps, but greatly limits `explorer.exe` for example.

12. Observed that even `nautilus` on `ubuntu` gets random crashes and then request to send crash report with details, even if raspberry tap is working.
   - these 2 last observations make me think there are different hackers trying to reach my laptop, either through ISP and exploiting processes, or through `RF`.

13. This morning `2025-05-19` TV stopped twice, and in between the ISP modem stopped providing internet for 30min. Between 08:00-08:30 local time. This makes me think it was a diverted coaxial cable as well. The other possibility is of the TV getting hacked through `IR` through a window from over 200m away, but this seems more implausible to me.

14. Today, `2025-05-20` after calling a phone number, the SIM card phone number associated with the ISP mobile\internet\TV contract stopped working. Removing SIM card and plugging it back in the phone works for 5 seconds, afterwards mobile phone reports no network connection despite being in direct LOS with 3 GSM antennas. This makes me think phone is actively jammed from neighbouring houses, or ISP blocked phone number from the network. For more information see `SS7 Veritasium` on youtube, which makes me think someone was spoofing my phone number and using it for neferious means.
   - rebooting phone with SIM card inserted seems to have fixed the issue, makes me think SIM cards load some code into phone bootup

15. Today, `2025-05-21` disconnected controller gate, which asside from digital power meter is the only way for `RF` inside the electrical grid of the house. This makes me think of manually interrupting or removing plugged-in devices like `TV`, `Fridges`, `Washing machine`, `Water pump`, `Electrical Boiler`, to pin the source. If it has smart chip, and has electrical power it can transmit from inner electrical grid to outside environment.

16. After doing the step above, getting `RF ~ 1-2mW/m2` over a couple of light switches around the house, usually they were emitting only `EF ~ 200-400 V/m` or `MF ~ 0.01-0.02μT` and not `RF`.
   - all this makes me rethink the electrical wiring inside the house was messed up by latest electrician that came around
   - as far as I remember when we connected the electrical power to the gate we had `power plugs` and `light switches` on sepparated circuits, and the gate was not running of `main line`, but on `one phase` from `tri-phase power`, maybe recalling it wrong, but I doubt it.
      - So 2 `validated` electricians came in and swapped out correctly done circuits, one "upgraded" the electrical meters and then scrambled all the `main line` and `tri-phase` circuits, the other "fixed" plugs and switches and created a short-circuit by connecting one `null` from light switches and `ground` from power plugs.
         - either way stuff emitting `RF` is still in the power network

   - for future employers: these reasons are exactly why I do not want to `work remotely` or `from home`, since I cannot digitally secure the premises, like a well managed office should be able to do

17. Since today `2025-05-22` observed that both mobile phones that are around me, have GSM signal without having SIM card installed. That is not normal. Yesterday got some weird proximity hack to the phones.

18. Today `2025-05-22` observed `RF ~ 0.5mW/m2` from IDLE water pump system. This is not normal as the pressure-switch which activates the water pump is based on mechanical push, and not on digital systems. Could be the electrical power grid is pushing signal through to water pump through power cable, but I doubt it.

19. Thinking that copper pipes inside house are used to relay the signal to and from laptop, hence thinking of something connected to pipes inside the house, could be `electric boiler`, `wood burning boiler` or `gas burning boiler` - however all are turned off, or some other device inserted and connected to pipes. Or its the `water pump`. 
   - I have a hunch its the `water pump` and some other device that could be dropped down chimney to come in proximity to copper pipes. 
   - #Thanks plumbers.

20. Found out today `2025-05-23` that `gas burning boiler` emmits `RF`, despite it being unplugged from power. So there is some device in its proximity emitting RF. 
   - #Thanks gas installers.

21. Some `power plugs` and some `light switches` emmit `RF` while others do not, despite being on the same circuit, in both buildings on the property. 
   - #Thanks electricians.

22. Learned that `RF` can leak through conductors like power cable to outside of house. House is built with reinforced steel cage, acting like a blocker for `RF`.

23. `2025-06-02 19:11 UTC+0` After having reconnected `HDD` to the laptop with sepparate non-OS NTFS partition, and I think my laptop is rootkitted, someone connects to it when I am not in the room and impersonates me, and they watch what I do constantly like a VM streaming. The laptop was running hot instead of cooling down, and when I opened the screen it was unlocked and the desktop looked like it was a dual screen, then it reset to the base screen.
   - its more than the third time that this happens on windows
   - laptop was not connected to ethernet cable and `ISP modem` was unplugged
      - I think this is proof enough that its neighbours using illegal military grade `RF` hacking
         - if its not neighbours then drone has to be in proximity of my location, to penetrate walls reinforced with steel
         - other alternative is getting hacked through `power plug`
   - this did not happen on Ubuntu booted from USB, with `SSD` and `HDD` removed
      - on ubuntu I got hacked through wifi `auto reconnect` and spoofed wifi that stole my password
      - on ubuntu I got hacked through `nautilus` crash when running through ethernet instead of wifi
         - `ntfs-3g` corrupted `NTFS` partition on USB disk drive afterwards

24. `2025-06-05 06-22 UTC+0` Lost internet connection after cars were driving on front and back streets, my laptop has `wifi` board removed.
   - This means that `ISP modem` has some backdoor to enable others to connect, despite `2.4Ghz`, `5Ghz` and `Guest` wifi networks being turned off from the settings, and it not emitting `RF`. 
   - Or internet provider reset connection.
   - Or getting hacked through power plug and power cable.
   - In theory I am connected to coaxial cable that is untapped till the street entrance, where it enters underground, and I have the sole cable connection from this ISP provider, so there should be no neighbours connected to same cable.

25. `2025-06-05 19:11 UTC+0` After reinvestigating with `RF` meter found that in the attic the levels are `8-9mW/m2` and they are exactly in the area where I was keeping an double induction stove from Royalty Line. Makes me think neighbour is energizing the plate and using it as hacking antenna inside the property. This makes me think there are other appliances like the gas carbon dioxide meter or the upper plate of the gas boiler, which are energized and used as antennas inside the property.
   - other thing there is an old sofa chair - remember to move it around to see if there is some device hidden in it, or bare metal antennas and circuits
   - so at both `C` and `N` are emissions over `8mW/m2` inside the property

26. `2025-06-06 08:57 UTC+0` This morning realized that someone deleted something from the `HDD`, as there was `2.4Gb` left on Data partition yesterday before I went into town, but today found that there is `3.0Gb`. Its weird since I did not delete files, but added more files to the `HDD`. So free space should have decreased, not increased. So either someone deleted files that contained logs from my system, or there was some sort of hidden partition `clone OS` that was booting from this `HDD`. 
   - need to create backups of whole disks periodically, for future analysis, however this is highly costly for individuals that just want to have a damn OS that is not backdoored or hacked by different people
      - clearly different levels of hacking
      - need to think about such hit-and-run tactics and how to interrupt attempts
      - I leave the laptop secured in `RF` bag, unplugged without battery, so the only way is for people to access the device and plug in the battery, or the power plug
         - whenever I go into the city, someone is accessing my laptop, inside my own home
         - mom says she is not allowing anyone, so they must be accessing while she is gardening outside
      - it could have been leaving the ethernet cable in the laptop during boot time, even if only for 1 second, but that means that the raspberry pi is also hacked, or that the usb-ethernet adapter had custom firmware to remove the hidden partition during bootloading

27. `2025-06-08` Observations for the past week:
   - Some keyboard keys are no longer working properly, like the `S` key. This persists even if `explorer.exe` is restarted, or the user is relogged in.
   - Today saw that some key combinations do not work properly. After restarting `explorer.exe` the problem disappeared. 
   - Another issue is that if the `C` and `D` partitions have less than `1Gb` free space left, windows keeps showing up alerts about freeing up space. And I think that this is actually delaying the hijacking, as without free space to create hidden partition from which to boot up rootkit, then the OS does not boot the `clone OS`.
      - This makes me think of a possible solution for anti-rootkit OS, in the form of a VM which is limited to the size of the files and always requests larger disk size, whenever downloads or copying of files is happening, this way blocking hackers from installing changed files, or from creating hidden partitions in free space of partions.
      - Another idea is to completely drop off regular windows processes, and create a forked windows, which runs custom build executables, and has extra security features enabled.
         - kind of like firewall definitions for actions on the OS
         - also thought of creating custom firewall solution, which is controlled outside of the OS
            - so like a UAC popup for new actions, but the rules and enforcement are done on the associated mini-computer tap, and not on the client laptop
      - another idea to clean up this bullshit, is to have custom USB disk, scanning all partitions and finding hidden partitions in free space and cleaning them
         - checking the files, not just sumcheck, need to do actual 1-to-1 comparisons with pre-approved disk image
            - will need to figure out how to make forensic tools which do not erase the evidence of these hacks
               - had idea to use HDD only, and have read-only controllers installed for OS disk
                  - however this slows down, as HDD runs `40-100 MB/s` while SSD can run from `100-500MB/s` or even faster

28. `2025-06-17 ~ 08:09 UTC+0` - somehow my window C partition got `5Gb` removed from it, while I was browsing `twitch.tv` and `youtube.com` on `chrome.exe`. Does not make any sense, how can windows self remove files without people knowing?
   - as far as I know I did not download any DRM content
   - so either windows is deleting files on personal computers on purpose - which is major breach of trust and IP theft
   - or rootkit driver is deleting hidden partitions on disk, hidding in free space between files

29. `2025-06-19 ~ 03:58 UTC+0` - ran command `sudo ./bridge.sh` on `ubuntu` and got output of `dir` command, then run command again and got actual output. This makes me think everything I am running is virtualized, `ubuntu` and `windows` - basically I am not in control of my own devices.

30. `2025-06-19` - logged in as admin on `windows` and observed all the firewall rules were scrambled, somehow all the rules that I disabled and the blocked firewall all returned to defaults which exposes the OS to more backdoors. Then as I was disabling rules, storage sense got automatically activated. 
   Based on all my observations I am `100%` sure I am not running `windows` or `ubuntu`, but some `bullshit cloned VM OS`. Its like running a VM in cloud with defects in apps, and all that without actually being connected to the internet.
      - only thing connected is `power plug`
      - re-editing firewall to block app, results in `git.exe` not being able to push code to remote server, despite it being allowed
         - in short `git.exe` needs outgoing firewall disabled to push code to `github.com`
         - `firefox.exe` and `chrome.exe` work, with rule added, but they need all ports enabled in firewall

31. `2026-06-22 ~ 08-00 to 08-29 UTC+0`
   - mom goes outside house, supposedly watering plants
   - while watching `youtube.com` on `chrome.exe` getting multiple ads triggered on video, 2 or 4
   - then `updater.exe` spawns and changes files on disk
   - cars drive by my front street and I get lagged internet conectivity
      - if I stop `explorer.exe` process then laggy streams is not happening
         - if I do not stop the process, I get low disk space notifications, even if laptop is not connected to ethernet
            - so either they hack the power cable, or the CPU
      - if I disconnect internet cable, again laggy streams are not happening
         - if cars are doing `RF` hacking it means they are targetting the `ISP modem`, since my laptop has no WIFI board plugged in
         - the hardline connection should be coaxial land line, which ends up plugged into underground main, at the start of the street, so `RF` hacking should not work
   - mom tries to give me food when some of the hacks are happening - like a distraction from my PC
         - all these makes me think the hackers are `local` and not `remote`, in close proximity of my location
         - they are using multiple processes on my PC to communicate something between processes
            - would require some VM to actually log file changes and process IPC or shared memory transfers

   - so far this is what I see:
      - stealing my files from HDD and SSD
      - impersonating me
      - illegally using my resources, PC, power, network connection
      - only solution is to literally not use the laptop
         - I have retried factory reset and clean reinstallation of windows multiple times, but I still get hacked back afterwards

32. `2025-06-22 08:45 UTC+0`
   - in order to figure out why `git.exe` does not push commits if allowed through firewall, but if firewall is off it works fine
   - logged into admin account and started `procmon.exe`
   - locked out, and logged into user account
      - while logging in, background screen changed, and the logging in took over 1 minute
      - this makes me think of hijacking of admin account, when logging into user account

33. `2025-07-04 07:26 UTC+0`
   - between `06:00 and 07:00 UTC+0` I was in different house painting cracks, when I came back my mobile phones were not in the same position I left them
      - mom supposedly came back to grab detergent, but I think she allows other people physical access to my devices
      - makes me think people are cloning my SIM cards, my phone IMEI identifiers or literally swapping my devices with rootkitted ones
         - or they are making phone calls pretending to be me, while I am nearby

34. `2025-07-15 16:55 UTC+0`
   - I went to bathroom, unplugged laptop from ethernet and stopped power to ISP modem around `19:00 UTC+3`
   - came back around `19:30 UTC+3` and mom reported BOLT car in front of house
      - as I turned on ISP modem and reconnected ethernet cable to my laptop, my internet connection was reset and my `amazon.com` got `logged out`
   - HDD started spinning inside my laptop without me opening the disk drive associated in `explorer.exe`
   - mom came inside house and turned on TV
   - `time slipped` and when I looked at my watch it was `19:50 UTC+3` for a chit-chat with mom about green vegetables she picked up, which in my mind took `5m` not `20m`
   - I unplugged ethernet, and stopped both TV and ISP modem, then turned back on only ISP modem
      - I rechecked my `amazon.com` account and what a surprise, I was `NOT logged out`
   - HDD started spinning inside my laptop without me opening the disk drive associated in `explorer.exe`

   => makes me think of one neighbour hacking my laptop through `HDD backdoor`, with some `Magnetic Field emitting device`
   => makes me think BOLT driver hijacking my `ISP modem` through `Radio Field hacking` - despite WIFI turned off on modem, somehow they hijack the device
      -> so at least 2 hackers in my proximity using illegal hijacking devices to hijack both my laptop and my ISP modem
         -> suspecting a 3rd hacker using `TV backdoors`
               => this is way beyond my software skills
               => this is not SCI-FI, those people and others have been hacking me for months if not years

35. `2025-07-16 06:23 UTC+0`
   - I turned off TV, then off and on my ISP modem
   - then weird cars drive by and my HDD starts spinning
   - this happens even if `explorer.exe` is stopped
      - need to confirm it happens even if my laptop is disconnected from ethernet cable

36. `2025-07-16 09:13 UTC+0`
   - terminated `explorer.exe` process because it keeps showing `running out of disk space` or `update virus protection` notifications
   - unplugged ethernet cable
   - restarted `explorer.exe` process through task manager, and got 2 running processes
```
tasklist /fi "imagename eq explorer.exe"

Image Name                     PID Session Name        Session#    Mem Usage
========================= ======== ================ =========== ============
explorer.exe                  7244 Console                    1    270,740 K
explorer.exe                  4588 Console                    1    462,648 K
```
   -> all this makes me think I am getting hacked at different layers
      - electrical cable and internet level
      - hardware level - all devices
      - driver level
      - process level
      - browser cookies level

37. `2025-07-16 10:48 UTC+0`
   - signed out of user account
   - unplugged power cord
   - rebooted OS
   - `chrome.exe` cookies got wiped
      - does not make sense unless `chrome.exe` was still running after signing out
      - or windows kernel did not make the changes to disk
   - before when I did this cookies were not affected

38. `2025-07-16 15:58 UTC+0`
   - mom came and turned on TV
   - got `ERR_NETWORK_CHANGED` in `chrome.exe`

39. `2025-07-18 ~ 07:00 - 07:15 UTC+3`
   - saw a black jacket in the courtyard around the `L` point in `RF Map`, went outside and heard movement around `P` location over the fence
   - heard last year, 2024 someone footstepping and jumping fence around `E` point on `RF Map`, then saw a dark haired, hair length to neckline, guy with long black jacket,  walking down street around `H` point, while I was petting the cat around `F`
      - this guy is shorter than me, I am almost `1.8m` or `6ft`, this guy is `1.7m` or `5ft 7in`
      - the guy does not wear glasses, I have prescription miopia glasses
   - saw multiple times shadow on wall inside small house while sitting at `C`
      - all this makes me think someone else pretending to be me around my house
      - I recently had a hair cut, I used to have hair tail below neck level
      - there is a black doorbell on the fence around `H`, ring the bell to alert me inside house if you think you saw me

      - so I have multiple physical and digital clones

40. `2025-07-18 09:00 UTC+0`
   - I removed ethernet cable
   - started `explorer.exe` process
   - created new folder and as I was typing folder name, I removed the ethernet to USB adapter, and the `explorer.exe` interrupted the folder name typing, makes me think of USB tap pretending to be keyboard that steals my keystrokes hidden in ethernet adapter
      - see `Diagram 3`
      - makes me think switching from `wifi` to `ethernet` this year, did nothing but change the hacker groups that access my laptop

41. `2025-07-18 13:29 UTC+0`
   - I terminated `explorer.exe` process
   - car drives by on the street
   - `HDD` starts spinning without me accessing disk drive
      - again makes me think neighbour using `Magnetic Field emitting device` to hijack laptop through HDD
   - if the `USB-ethernet adapter` is connected then `explorer.exe` does weird stuff, even if ethernet cable is disconnected
      - this makes me think of multiple backdoor exploits that need 2 or more pre-conditions to work
            - `explorer.exe` - application layer
            - `USB-ethernet adapter` - kernel layer, adds driver in the driver stack, intercepting hardware interrupts, which could access other devices messages
               - again this goes with the rootkitted OS theory

42. `2025-07-19 ~ 20-21 UTC+3`
   - yesterday late evening saw a guy driving ATV in front of my house with similar haircut to me
   - I do not drive ATV

43. `2025-07-19 09:44 UTC+0`
   - time slipped between `12:20 - 12:40 UTC+3`
   - bad headache
   - mom left outside for like 1 minute, pretends nothing happened

44. `2025-07-28 14:38 UTC+0`
   - this morning mom woke up ahead of me and was sitting in chair beside her bed - she never does this
   - makes me think she is accomplice in allowing physical access to my devices
   - makes me think she is accomplice in allowing access to my clothes, while I am away in town or working on the laptop and not being in line of sight of shoes and t-shirts
      - need to figure out how to actually communicate in case of this level of impersonation
      - tattoos and scars that only trusted people know are not enough

# RF map - everything diagram
- main takeaway, front fence is peppered with RF, tracking devices walking/driving on street

                  P :
                    :---------------------------:
                    :  ____                  __ :
                    : |____|  L   ______    |  |:
      --------------:  __G_      |      |   |__|:
        __________  : |A   |     |      |_____  :
       |          | : |    |     |            | :
       |          | : |    |     |            | :
       |          | D |CM_B|     |     O     N| :
       |__________| 1            |___K________| :
                    :           F      J      E :
      --------------:-------[---]---------------:
                              H     .
                                       .
                                          .
                                             .
                                               [~ 200m - 3 GSM antennas]

- A - water pump `(RF ~ 0.5mW/m2)`
   - despite it being pressure switch
- B - TV and ISP modem `(RF ~ 0mW/m2)`
   - wifi turned off for both
- C - wall inside house `(RF ~ 1-2mW/m2)` - brick wall
   - wall in the attic `(RF ~ 8-9mW/m2)` - wood and drywall
- D - neighbour fence `(RF ~ 4-5mW/m2)`
- 1 - neghbour house `(RF ~ 5-6mW/m2)`
- E - neighbour fence `(RF ~ 4-5mW/m2)`
- F - main gate controller `(RF ~ 0mW/m2)`
   - stopped completely
- G - outside power plug and light switch `(RF ~ 1mW/m2)`
- H - readings around front fence `(RF ~ 4-8mW/m2)`
   - in LOS of nearby antennas
- J - gas meter shutoff valve `(RF ~ 4mW/m2)`
   - connected to power inside house
- K - digital electrical meters `(RF ~ 2mW/m2)`
   - despite company saying these are not self reporting index meters
- L - readings inside property boundary `(RF ~ 0mW/m2)`
   - usually, except for points above
- M - laptop readings `(RF ~ 0mW/m2)` after removing `battery`, `HDD`, `WIFI` card, `speakers`,
   - however sometimes still got (RF ~ 4mW/m2) from `motherboard` or from `SSD`, not from `CPU` or `GPU`
   - this is where all this `RF` investigations started
- N - gas boiler readings `(RF ~ 5-6mW/m2)`
   - turned off completely, so what is powering this emissions ???
   - carbon dioxide sensor and auto-shutoff valve also not powered
   - today `2025-05-26` turned off whole power grid inside home, but still got same `RF` readings inside the house
   - confirmed CO2 detector was leaking `RF` through the disconnected power cable to outside to shut-off valve, connecting `N` and `J`
- O - media box for TV set
   - was and is disconnected for years, assuming its being used for hacking by ISP company, backdooring house

# Next steps
1. Need to write some python scripts that can process the capture files from `client` and `tap` and then compare to find differences.
2. Need to write some client-server interface, that automatically uploads capture files to a third computer which will analyse the files.
   - Ideally will develop some driver for windows and driver for linux which instead of relying on usermode captures and logs.
3. Getting newer raspberrypi or other mini computer, since the old versions are limited in power and RAM
4. Based on dynamical observations, some RF is not constant, need to create some devices for snooping RF and taking recordings and GPS coordinates of the emissions, pin pointing devices that emmit just when activated from outside RF or from electrical grid
5. Need to sepparate back whole grid, and figure out how to sepparate systems inside house, so that they do not cross-communicate through electrical grid

# Not used for now - useful for future developments
## Configuring RaspAP
1. Install `raspap` [ https://raspap.com/ ]
   - tried this and its hard to configure the bridge afterwards, so that the tap works
   - this is however nice interface for sharing wifi, but encountered different problems with Wifi cloned, see notes above

## Configuring firewall
1. Install `ufw` [ https://forums.raspberrypi.com/viewtopic.php?t=369871 ] - for easier firewall management
   - will have to figure out how to properly configure firewalls, and ideally have control of apps on the client machine, like a permission manager, blocking `bloatware` and `spyware` from sending data
      - for example `typing data` and `audio data` which then gets used by `ad providers`
