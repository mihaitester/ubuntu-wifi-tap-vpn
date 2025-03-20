# Idea
After getting hacked multiple times, through various means, decided to create a mini tap using a mini computer such as `raspberry pi` and `wireshark`. 
1. Idea would be to track `man in the middle` attacks done over the wifi network and block with a custom firewall the attacks. 
2. Also such a mini tap could help find out if the client operating system is `rootkitted`.
3. From experience ISP modem / router device could be `hijacked and controlled remotely by ISP`, hence the idea is to block attempts of hacking from Modem / Router.


# Diagram

    Client laptop                                                    ISP Modem / Router
     ________                     Mini computer tap                        __
    |        |                       ________                             |  |
    |________|-----(   WIFI   )-----|________|=====[   ETH cable   ]======|  |======[   Coaxial landline   ]
    /________/           |                                                |__|
         .               |                                                  .       
         .               |                                                  .
         .            ___|____                                              .
        [2]          |        |                                            [3]
                     |________|                                                  
                      \________\
                         Hacker
                            .
                            .
                            .
                           [1]

# Docs

# Install
1. Buy mini computer / raspberry pi
2. Download Ubuntu linux [ https://ubuntu.com/download/raspberry-pi ]
3. 