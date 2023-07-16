#!/bin/bash

gnome-terminal -t "roscore" -x bash -c "roscore;exec bash;"
sleep 1.5s

gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;roslaunch uav_simulation env_simulation.launch;exec bash;"
sleep 1.5s

gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;roslaunch uav_simulation uav_simulation.launch;exec bash;"
sleep 1.5s

gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;roslaunch uav_simulation referee_system.launch;exec bash;"
sleep 1.5s

gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;rosrun uav_simulation command_process.py;exec bash;"
sleep 1.5s

# gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;rosrun uav_simulation start_trigger;exec bash;"
# sleep 1.5s

# gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;roslaunch apriltag_ros continuous_detection.launch;exec bash;"
# sleep 1.5s

gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;roslaunch apriltag_ros start.launch;exec bash;"
sleep 1.5s


# #启动keyboard控制器
# gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;rosrun uav_simulation keyboard_control.py;exec bash;"
# sleep 1.5s

#启动keyboard控制器
# gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;rosrun uav_simulation detector;exec bash;"
# sleep 1.5s

#启动我们的控制器
# gnome-terminal -t "uav_simulation" -x bash -c "source devel/setup.bash;rosrun uav_simulation controller.py;exec bash;"
# sleep 1.5s


