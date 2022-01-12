# ECL_robotic_cell

Robotic cell setup in Princeton ECL:
* 2 x IRB4600/2.55 on 3.9m tracks
* 1 x IRB7600 stationary

## Multiple Robot Connect

1. Connect robots with ethernet via x6/WAN port -> ethernet switch -> PC
2. For each robot: Restart -> Advanced -> Launch Boot Application-> set the ip addresses to 192.168.0.xxx(arbitrary, different for each). 
    used 102 and 103 for 286 and 386 respectively) & default gateway to 192.168.0.254 (same for all). This configures the WAN port
3. On the PC network adapter settings -> IPv4, set ip address to 192.168.0.101 and default gateway to 192.168.0.254
4. Now both robot controllers should be able to be added in RobotStudio. Set the ip for each robot respectively (CHECK WHERE AGAIN)
5. Set the corresponding ip addresses in grasshopper/python when sending commands

# FOR ABB4600/7600

## Current ServicePort Config
Default IP: 192.168.125.1

## Current WAN Config
IP Addresses:
4600: 192.168.0.102
7600: 192.168.0.103
PC: 192.168.0.101
Default Gateway: 192.168.0.254
