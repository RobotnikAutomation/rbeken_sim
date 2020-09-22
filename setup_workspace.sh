#!/bin/bash

echo "Downloading dependencies..."

git clone https://github.com/RobotnikAutomation/rbeken_common --branch melodic-devel
git clone https://github.com/RobotnikAutomation/robotnik_msgs
git clone https://github.com/RobotnikAutomation/robotnik_sensors --branch melodic-devel
git clone https://github.com/RobotnikAutomation/rcomponent
git clone https://github.com/RobotnikAutomation/robotnik_base_hw_sim 
git clone https://github.com/RobotnikAutomation/battery_manager 
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver
git clone https://github.com/fmauch/universal_robot.git fmauch_universal_robot --branch calibration_devel
git clone https://github.com/RobotnikAutomation/gazebo_ros_pkgs --branch melodic-devel
git clone https://github.com/RobotnikAutomation/roboticsgroup_gazebo_plugins 
git clone https://github.com/RobotnikAutomation/robotnik_gazebo_models 

echo "Installing models..."
cd ./robotnik_gazebo_models && ./install_models.sh