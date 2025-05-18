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
      - If connecting `power plug` to laptop, but sitting between laptop and wall, then getting `MF` readings fluctuating `0.1-0.2microT`, similarly from `SSD` area
      
      - `!!!` If connecting `power plug` or `ethernet cable` laptop starts emitting `RF` `!!!`
   
10. During hacking there is a sudden lag on the client laptop, in youtube streams for example, then client returns to normal, but the raspberrypi capture gets delayed and stops working, however internet connection does not experience further delays. This is weird, its like not being connected to ISP modem through the ethernet raspberry tap. Resetting raspberrypi tap breaks the network connection.
   - this is why I am suspecting power plug is involved into the hacking of the devices
   - the only other explanation is actively getting hacked through RF from outside sources, but the only readings are near the neighbouring wall, and raspberrypi is not in range of those readings

# Next steps
1. Need to write some python scripts that can process the capture files from `client` and `tap` and then compare to find differences.
2. Need to write some client-server interface, that automatically uploads capture files to a third computer which will analyse the files.
   - Ideally will develop some driver for windows and driver for linux which instead of relying on usermode captures and logs.
3. Getting newer raspberrypi or other mini computer, since the old versions are limited in power and RAM

# Not used for now - useful for future developments
## Configuring RaspAP
1. Install `raspap` [ https://raspap.com/ ]
   - tried this and its hard to configure the bridge afterwards, so that the tap works
   - this is however nice interface for sharing wifi, but encountered different problems with Wifi cloned, see notes above

## Configuring firewall
1. Install `ufw` [ https://forums.raspberrypi.com/viewtopic.php?t=369871 ] - for easier firewall management
   - will have to figure out how to properly configure firewalls, and ideally have control of apps on the client machine, like a permission manager, blocking `bloatware` and `spyware` from sending data
      - for example `typing data` and `audio data` which then gets used by `ad providers`
