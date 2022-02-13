# ECL_robotic_cell

## Robotic cell setup in Princeton ECL:
* 2 x IRB4600/2.55 on 3.9m tracks
* 1 x IRB7600 stationary

## Multiple Robot Connect

1. Connect robots with ethernet via x6/WAN port -> ethernet switch -> PC
2. For each robot: Restart -> Advanced -> Launch Boot Application-> set the ip addresses to 192.168.0.xxx(arbitrary, different for each). 
    used 102 and 103 for 286 and 386 respectively) & default gateway to 192.168.0.254 (same for all). This configures the WAN port
3. On the PC network adapter settings -> IPv4, set ip address to 192.168.0.101 and default gateway to 192.168.0.254
4. Now both robot controllers should be able to be added in RobotStudio (Controller --> Add Controller).
5. Rapid Code changes
    WAN port + ethernet switch connect - Under RRC_Config_ctrl, set the b_RRC_AutoIPAddress to TRUE, if you want to connect with the IP that was set
    Serviceport connect - Under RRC_Config_ctrl, set the b_RRC_AutoIPAddress to FALSE, will connect with the IP that is set in the st_RRC_IP_AddressMan variable, default is 192.168.125.1
5. Docker file changes
    For ECL_IRB4600 docker files (used for ACADIA) with WAN port - in the main.launch file have to change the "robot_ip" variable to match the controller IP that has been set, 192.168.0.102, doesnt work if you give switch IP. 
    For ECL_IRB4600 docker files (used for ACADIA) with ServicePort - in the main.launch file have to change the "robot_ip" variable to defauly 192.168.125.1. 
    Otherwise if you want to connect to both controllers, can use the docker file under rrc_physical_controller. But no move_it capabilities here yet.
6. Set the corresponding ip addresses in grasshopper/python when sending commands

# FOR ABB4600/7600

## Current ServicePort Config
Default IP: 192.168.125.1

## Current WAN Config
IP Addresses:
4600: 192.168.0.102
7600: 192.168.0.103
PC: 192.168.0.101
Default Gateway: 192.168.0.254

## Docker
Compose up on any of the three docker setups available:
* ECL_2rob_cell (both 4600s on tracks)
* ECL_3rob_cell (7600 and 4600s on tracks)
* ECL_IRB7600 (single 7600 robot)

This should allow you to work with any of these setups, to do path planning and to send commands through RRC.


## Windows and ROS

Generating xacros and moveit files with Ubuntu running on Windows. 

* Using windows terminal: https://docs.microsoft.com/en-us/windows/terminal/install
* Ubuntu 20.04 through WSL: https://docs.microsoft.com/en-us/windows/wsl/install
* ROS on Linux through COMPAS Fab documentation: https://gramaziokohler.github.io/compas_fab/latest/backends/ros.html
* Creating URDF from xacro files: https://gramaziokohler.github.io/compas_fab/latest/examples/03_backends_ros/07_ros_create_urdf_ur5_with_measurement_tool.html
* Creating Moveit Packge: https://gramaziokohler.github.io/compas_fab/latest/examples/03_backends_ros/08_ros_create_moveit_package_from_custom_urdf.html
    * currently the latest version on moveit is generating config files that do not work with the docker images. Generate files in a format that match the current setups (manual edit, time consuming...)
* To use tools in Linux that have GUI (i.e., moveit setup installer) need to have some visualization software running:
    * VcXsrv: https://sourceforge.net/projects/vcxsrv/
    * Some settings: https://turlucode.com/running-ros-inside-windows-10-with-gui-support-wsl/
    * found that display should be set to 0.0 and not 0

Basically work in Linux (through WSL), and then copy files that are generated over to location on local windows system