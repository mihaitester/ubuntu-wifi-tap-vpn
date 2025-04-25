# Idea
After getting hacked multiple times, through various means, decided to create a mini tap using a mini computer such as `raspberry pi` and `wireshark`.

0. It would be impossible to detect `snooping hacker` which just listens passively to `wifi` packets - can only reduce the area of `wifi` signal by configuring all devices to emit low power, drastically reducing range of wifi to a couple of meters.
1. Idea would be to track `man in the middle` attacks done over the wifi network and block with a custom firewall the attacks. 
2. Also such a mini tap could help find out if the client operating system is `rootkitted`.
3. From experience ISP modem / router device could be `hijacked and controlled remotely by ISP`, hence the idea is to block attempts of hacking from Modem / Router.
4. Adding `firewalls` to the inner network and the outer network.
5. Adding `VPN layer` so that all packets leaving through ISP are encrypted. However this will require another computer to be set up as VPN server.
   - see `Diagram 2`

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
                        [4]                    .                [4]
    Client laptop         .                    .                 .        ISP Modem / Router
     ________             .           Mini computer tap          .               __
    |        |            .                ________              .              |  |
    |________|=====[   ETH cable   ]======|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]===
    /________/                                                                  |__|
         .                                                                       .
         .                                                                       .
         .                                                                       .
        [2]                                                                     [3]

# Docs

# Requirements
1. mini computer / raspberry pi
2. 1 sdcard 32GB [ write ubuntu ISO ]
   ## Optional
   3. secondary mini computer / raspberry pi
   4. secondary sdcard 32GB

# Install from Windows
1. Download Ubuntu linux [ https://ubuntu.com/download/raspberry-pi ]
2. Download Rufus [ https://rufus.ie/en/#google_vignette ]
3. Write Ubuntu ISO to USB flashdisk [ https://ubuntu.com/tutorials/create-a-usb-stick-on-windows#5-write-the-iso ]
4. Install sdcard inside raspberry pi

# Install from Linux
1. Use Gparted to format USB flashdisk [ 1 Ext4 partition + 1 Swap partition ]
2. Use DD to write Ubuntu ISO to USB flashdisk [ https://linuxconfig.org/burning-cds-over-the-internet-with-or-without-iso-image ]
3. Install sdcard inside raspberry pi

# Configuring RaspAP
1. Install [ https://raspap.com/ ]
   - note however that setting up this will make it difficult to configure

# Configuring firewall
1. Install `ufw` [ https://forums.raspberrypi.com/viewtopic.php?t=369871 ] - for easier firewall management

# Windows commands
1. `netstat -nao` - list processes and ports they are using
   - `netstat -naob` - requires administrator access
2. `tasklist` - list processes running currently
3. `wireshark` - capture from interface and rotate file based on duration


# Important
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