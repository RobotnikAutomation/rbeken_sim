# rbeken_sim

Packages for the simulation of the RB-Eken robot.

---
## Packages

### rbeken_gazebo

Launch files and world files to start the models in gazebo.

### rbeken_sim_bringup

Launch files that launch the complete simulation of the robot/s.

---
## Installation

To install the simulation packages of the RB-Eken robot, you just have to download this repository in your workspace and compile.

### Dependencies

To run the RB-Eken simulation, you will need to install some dependencies. The [setup_workspace.sh](./setup_workspace.sh) automatically downloads all the dependencies and install the necessary models to run the simulation. If you prefer, you can download them manually:

- **rbeken_common** [🔗](https://github.com/RobotnikAutomation/rbeken_common)

```bash
git clone https://github.com/RobotnikAutomation/rbeken_common --branch melodic-devel
```

- **robotnik_msgs** [🔗](https://github.com/RobotnikAutomation/robotnik_msgs)

```bash
git clone https://github.com/RobotnikAutomation/robotnik_msgs
```

- **robotnik_sensors** [🔗](https://github.com/RobotnikAutomation/robotnik_sensors)

```bash
git clone https://github.com/RobotnikAutomation/robotnik_sensors --branch melodic-devel
```

- **rcomponent** [🔗](https://github.com/RobotnikAutomation/rcomponent)

```bash
git clone https://github.com/RobotnikAutomation/rcomponent
```

- **robotnik_base_hw_sim** [🔗](https://github.com/RobotnikAutomation/robotnik_base_hw_sim )

```bash
git clone https://github.com/RobotnikAutomation/robotnik_base_hw_sim 
```

- **battery_manager** *[🔗](https://github.com/RobotnikAutomation/battery_manager )

```bash
git clone https://github.com/RobotnikAutomation/battery_manager 
```

- **Universal_Robots_ROS_Driver** [🔗](https://github.com/UniversalRobots/Universal_Robots_ROS_Driver)

```bash
git clone https://github.com/UniversalRobots/Universal_Robots_ROS_Driver
```

- **universal_robot** [🔗](https://github.com/fmauch/universal_robot.git )

```bash
git clone https://github.com/fmauch/universal_robot.git fmauch_universal_robot --branch calibration_devel
```

- **gazebo_ros_pkgs** [🔗](https://github.com/RobotnikAutomation/gazebo_ros_pkgs )

```bash
git clone https://github.com/RobotnikAutomation/gazebo_ros_pkgs --branch melodic-devel
```

- **roboticsgroup_gazebo_plugins** [🔗](https://github.com/RobotnikAutomation/roboticsgroup_gazebo_plugins )

```bash
git clone https://github.com/RobotnikAutomation/roboticsgroup_gazebo_plugins 
```

- **robotnik_gazebo_models** [🔗](https://github.com/RobotnikAutomation/robotnik_gazebo_models )

```bash
git clone https://github.com/RobotnikAutomation/robotnik_gazebo_models 
```

\* This package is private. Do not worry if you have not access to this repository, the simulation will work but you will not have access to some funcionalities of the real robot.

After downloading all the packages you will need to install the custom robotnik models to be able to load them in Gazebo. Available in [robotnik_gazebo_models](https://github.com/RobotnikAutomation/robotnik_gazebo_models )


You can run the following command being located in the workspace folder to install all defined dependencies.

```bash
rosdep install --from-paths src --ignore-src -r -y
```

---
## Bringup
To run the simulation:
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch 
```
The README located in rbeken_sim_bringup provides more information about the different configurations to run the simulation.