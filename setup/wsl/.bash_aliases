# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi


# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias irb4600="abb_irb4600_40_255_TEST"

alias moveit="roslaunch moveit_setup_assistant setup_assistant.launch"
alias ros_disp="roslaunch princeton_cell display.launch"


# Functions
function bashrc () {
        source ~/.bashrc;}
export -f bashrc

function copy_load_bash_files () {
    cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/wsl/.bashrc ~/.bashrc;
    cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/wsl/.bash_aliases ~/.bash_aliases;
    source ~/.bashrc;}
export -f copy_load_bash_files

function all_xacro_copy () {
        rm -R ~/catkin_ws/src/abb_irb4600_40_255;
        rm -R ~/catkin_ws/src/abb_irb7600_400_255;
        rm -R ~/catkin_ws/src/abb_on_axis;
        rm -R ~/catkin_ws/src/princeton_cell;
        rm -R ~/catkin_ws/src/princeton_3rob_cell;
        rm -R ~/catkin_ws/src/abb_resources;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_irb4600_40_255 ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_irb7600_400_255 ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_on_axis ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/princeton_cell ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/princeton_3rob_cell ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_resources ~/catkin_ws/src;}
export -f all_xacro_copy

function all_urdf_make () {
        cd ~/catkin_ws/src/abb_irb4600_40_255/urdf;
        rosrun xacro xacro --inorder -o abb_irb4600_40_255.urdf abb_irb4600_40_255.xacro;
        cp abb_irb4600_40_255.urdf /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_irb4600_40_255/urdf;

        cd ~/catkin_ws/src/abb_on_axis/urdf;
        rosrun xacro xacro --inorder -o abb_on_axis.urdf abb_on_axis.xacro;
        cp abb_on_axis.urdf /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_on_axis/urdf;

        cd ~/catkin_ws/src/abb_irb7600_400_255/urdf;
        rosrun xacro xacro --inorder -o abb_irb7600_400_255.urdf abb_irb7600_400_255.xacro
        cp abb_irb7600_400_255.urdf /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/abb_irb7600_400_255/urdf;

        cd ~/catkin_ws/src/princeton_cell/urdf;
        rosrun xacro xacro --inorder -o princeton_cell.urdf princeton_cell.xacro
        cp princeton_cell.urdf /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/princeton_cell/urdf;

        cd ~/catkin_ws/src/princeton_3rob_cell/urdf;
        rosrun xacro xacro --inorder -o princeton_3rob_cell.urdf princeton_3rob_cell.xacro
        cp princeton_3rob_cell.urdf /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/princeton_3rob_cell/urdf;}
export -f all_urdf_make


function all_moveit_copy () {
        rm -R ~/catkin_ws/src/moveit_3rob_cell;
        rm -R ~/catkin_ws/src/moveit_irb7600;
        rm -R ~/catkin_ws/src/princeton_cell_moveit;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/moveit_3rob_cell ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/moveit_irb7600 ~/catkin_ws/src;
        cp -R /mnt/c/Users/Edvard/Documents/GitHub/ECL_robotic_cell/setup/catkin/princeton_cell_moveit ~/catkin_ws/src;}
export -f all_moveit_copy
