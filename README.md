This has no version number:

`conda env export --from-history --name ecl_robotic_cell> environment.yml`

this has no build number:

`conda env export --no-builds --name ecl_robotic_cell > environment.yml`

create new:

`conda env create`

if you change the conda environment, make sure to update the file .git/hooks/pre-commit file
(I don't think pre-commit is installed for this repo, so probably ignore this)

`pre-commit install`


# ECL Robotic Cell

## Robotic cell setup in Princeton ECL

* 2 x IRB4600-40/2.55 on 3.9m tracks
* 1 x IRB7600-400/2.55 stationary

## Multiple Robot Connect

1. Connect robots with Ethernet via x6/WAN port → Ethernet switch → PC
2. Configuring robot WAN IP:
    * Restart → Advanced → Launch Boot Application
    * Set the IP addresses to 192.168.0.xxx (arbitrary, but different for each controller). Used 102 and 103 for 4600 and 7600 respectively.
    * Default gateway to 192.168.0.254 (same for all).
    * Connect both controllers to Ethernet switch
3. On the PC:
    * Ethernet switch to PC connection
    * network adapter settings → IPv4
    * Set IP address to 192.168.0.101 and default gateway to 192.168.0.254 for Ethernet switch
4. Now both robot controllers should be connected. Check in RobotStudio (Controller → Add Controller).
5. Controller Rapid Code changes:
    * WAN port + Ethernet switch connect. Under RRC_Config_ctrl, set the b_RRC_AutoIPAddress to TRUE, if you want to connect with the IP that was set in step #2
    * Serviceport connect. Under RRC_Config_ctrl, set the b_RRC_AutoIPAddress to FALSE, will connect with the IP that is set in the st_RRC_IP_AddressMan variable. Default is 192.168.125.1
6. Docker Compose files:
    * Make sure to pass variable for setting the IP if connecting through Ethernet switch.
    * If no variable set, the default is the Serviceport IP, 192.168.125.1.
7. Set the corresponding IP addresses in grasshopper/python when sending commands to send to correct controller.

## Docker

Compose up on any of the three docker setups available:

* ECL_2rob_cell (both 4600s on tracks)
* ECL_3rob_cell (7600 and 4600s on tracks)
* ECL_IRB7600 (single 7600 robot)

This should allow you to work with any of these setups, to do path planning and to send commands through RRC.

Set the GUI variable to TRUE to see the rviz launch moveit
Set the RRC variable to TRUE for robot control

## Windows and ROS

Generating xacros and moveit files with Ubuntu running on Windows.

* Using Windows terminal: [Microsoft Documentation](<https://docs.microsoft.com/en-us/windows/terminal/install>)
* Ubuntu 20.04 through WSL: [Microsoft Documentation](<https://docs.microsoft.com/en-us/windows/wsl/install>)
* ROS on Linux through COMPAS Fab documentation: [COMPAS Documentation](<https://gramaziokohler.github.io/compas_fab/latest/backends/ros.html>)
* Creating URDF from xacro files: [COMPAS Documentation](<https://gramaziokohler.github.io/compas_fab/latest/examples/03_backends_ros/07_ros_create_urdf_ur5_with_measurement_tool.html>)
* Creating moveit Package: [COMPAS Documentation](<https://gramaziokohler.github.io/compas_fab/latest/examples/03_backends_ros/08_ros_create_moveit_package_from_custom_urdf.html>)
  * `roslaunch moveit_setup_assistant setup_assistant.launch`
  * currently the latest version on moveit is generating config files that do not work with the docker images. Generate files in a format that match the current setups (manual edit, time-consuming...)
* To use tools in Linux that have GUI (i.e., moveit setup installer) need to have some visualization software running:
  * VcXsrv: [Install Page](<https://sourceforge.net/projects/vcxsrv/>)
  * Some settings: [Documentation](<https://turlucode.com/running-ros-inside-windows-10-with-gui-support-wsl/>)
  * found that display should be set to 0.0 and not 0
  * Search for XLaunch and manually setup, or open the `setup/wsl/xlaunch.config` file with XLaunch

Basically work in Linux (through WSL), and then copy files that are generated over to location on local Windows system

## Making URDFs with ROS

.bashrc and .bashalias files:
* copy the `.bashrc` and `.bash_aliases` files to the root directory in WSL
  * `cd ~` and `ls -la` to see dot files
* You can edit these files on Windows side and then copy over to with this function: `copy_load_bash_files`
* `alias` to see the alias, this will not show the functions though


xacro files:
* work on the `_macro.xacro` files on the windows side, and then copy over to Linux to make the URDFs
* Function to copy all xacro files from windows to Linux: `all_xacro_copy`
  * deletes existing folders under `~/catkin_ws/src/`
  * copies over new `launch`, `meshes`, `rviz`, `urdf` folders
  * copies over `CMakeLists.txt` and `package.xml` files
* Function to make all URDFs with ROS and copy these files back onto Windows: `all_urdf_make`
  * `rosrun xacro xacro --inorder -o URDF_OUT XACRO_IN`
  * then copies over the URDF file onto windows
* Run `catkin_make`
* Run `source devel/setup.bash`

## Check the generated URDFs and moveit

to see the URDF links (based on rviz config files saved in folders)

On Linux:

* rviz:
  * `roslaunch FOLDERNAME display.launch`
* XML check:
  * `cd ~/catkin_ws/src/FOLDERNAME/urdf`
  * `check_urdf URDFNAME.urdf`

On Windows:

check the URDF definitions by visualizing in RH/GH:

* open `setup/grasshopper/_ECL.3dm`
* open `setup/grasshopper/check_urdf.ghx`, load any of the URDFs with dropdown menu:
  * IRB4600
  * IRB7600
  * IRB4600 + track
  * 2 robot cell
  * 3 robot cell

check the moveit definition in RH/GH in  folder:

* open `setup/grasshopper/_ECL.3dm`
* if compose-up on *ECL_2rob_cell*: `setup/grasshopper/2rob_cell_visualize.ghx`
* if compose-up on *ECL_3rob_cell*: `setup/grasshopper/3rob_cell_visualize.ghx`
* if compose-up on *ECL_7600*: `setup/grasshopper/IRB7600_visualize.ghx`

## Work Object

measuring in tool: [Video Link](https://www.youtube.com/watch?v=l83fSt12-40)

create work object: [Video Link](https://www.youtube.com/watch?v=Qgij4_uiyGE)

wobj definition:

* x-axis is from X1 → X2
* y-axis is from X2 → Y1
* center is at X2
