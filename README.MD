# Summary of research
## Security recommendations based on observations
- Disable `auto-updates` for laptop and phones, and `auto-connect` to WiFi as hackers use these 2 to enter systems, change apps, and then leave the system without leaving trace of their hacking. These are the only 2 measures that can delay or block some intrusions, however for `RF` hacking the only solution is to increase distance, or not leave systems turned on when not in use.
   - never use banking app phones connected to `WiFi` 
   - get `usb-ethernet adapter` and `USB3 to USB-C adapter` for phone when connecting to banking apps
   - `SMS` alerts are not enough for `2FA`, as you can see in the `Netflix series Mr. Robot`, GSM towers can be faked and one time codes can be intercepted
   - in case OS system is rootkitted than cannot do anything substantially, all passwords stolen, can only request bank to disable online banking and phone apps and rely on bank office for transfers, which greatly delays everything
      - greater problem is identity theft, which can enable hackers to do serious damage by impersonation of people

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

    Client laptop                  ISP Modem / Router
     ________                              __
    |        |                            |  |
    |________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/                            |__|
         .                                  .
         .                                  .
         .                                  .
        [2]                                [3]

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
    /________/                                                                                        |__|
         .                                                                                              .
         .                                                                                              .
         .                                                                                              .
        [2]                                                                                            [3]

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

# RF map - everything diagram
- main takeaway, front fence is peppered with RF, tracking devices walking/driving on street

                    :---------------------------:
                    :  ____                  __ :
                    : |____|  L   ______    |  |:
      --------------:  __G_      |      |   |__|:
        __________  : |A   |     |      |_____  :
       |          | : |    |     |            | :
       |          | : |    |     |            | :
       |          | D |CM_B|     |            | :
       |__________| 1            |___K________| :
                    :           F      J      E :
      --------------:-------[---]---------------:
                              H

- A - water pump `(RF ~ 0.5mW/m2)` 
   - despite it being pressure switch
- B - TV and ISP modem `(RF ~ 0mW/m2)` 
   - wifi turned off for both
- C - wall inside house `(RF ~ 1-2mW/m2)`
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
   - this is where all this `RF` investigationss started

# Next steps
1. Need to write some python scripts that can process the capture files from `client` and `tap` and then compare to find differences.
2. Need to write some client-server interface, that automatically uploads capture files to a third computer which will analyse the files.
   - Ideally will develop some driver for windows and driver for linux which instead of relying on usermode captures and logs.
3. Getting newer raspberrypi or other mini computer, since the old versions are limited in power and RAM
4. Based on dynamical observations, some RF is not constant, need to create some devices for snooping RF and taking recordings and GPS coordinates of the emissions, pin pointing devices that emmit just when activated from outside RF or from electrical grid

# Not used for now - useful for future developments
## Configuring RaspAP
1. Install `raspap` [ https://raspap.com/ ]
   - tried this and its hard to configure the bridge afterwards, so that the tap works
   - this is however nice interface for sharing wifi, but encountered different problems with Wifi cloned, see notes above

## Configuring firewall
1. Install `ufw` [ https://forums.raspberrypi.com/viewtopic.php?t=369871 ] - for easier firewall management
   - will have to figure out how to properly configure firewalls, and ideally have control of apps on the client machine, like a permission manager, blocking `bloatware` and `spyware` from sending data
      - for example `typing data` and `audio data` which then gets used by `ad providers`
