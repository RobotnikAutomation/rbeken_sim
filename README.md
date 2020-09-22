# rbeken_sim

Packages for the simulation of the Campero robot.

---

## Packages

### rbeken_gazebo

Launch files and world files to start the models in gazebo.

### rbeken_sim_bringup

Launch files that launch the complete simulation of the robot/s.

---

## Installation

To install the simulation packages of the Campero robot, you just have to download this repository in your workspace and compile.

### Dependencies

To run the Campero simulation, you will need to install some dependencies.

- **rbeken_common**

It's currently located in the Campero repository, it will be automatically installed before the rbeken_sim packages.

- **robotnik_msgs** [🔗](https://github.com/RobotnikAutomation/robotnik_msgs)

It can be directly installed from the ros distro.

```bash
sudo apt-get install ros-kinetic-robotnik-msgs
```

If you prefer, you can download the package from its repository to have the most updated version in your workspace.

```bash
git clone https://github.com/RobotnikAutomation/robotnik_msgs
```

- **robotnik_sensors** [🔗](https://github.com/RobotnikAutomation/robotnik_sensors)

It can be directly installed from the ros distro.

```bash
sudo apt-get install ros-kinetic-robotnik-sensors
```

If you prefer, you can download the package from its repository to have the most updated version in your workspace.

```bash
git clone https://github.com/RobotnikAutomation/robotnik_sensors
```

- **universal_robot**

It can be directly installed from the ros distro.

```bash
sudo apt-get install ros-kinetic-universal-robot
```

In any case, you can run the following command being located in the workspace folder to install all defined dependencies.

```bash
rosdep install --from-paths src --ignore-src -r -y
```

---
## Bringup
There are 4 different possibilities for launching the robot. In the inside environment, in the outside environment and with the two or three finger gripper of robotiq. Those options are given as parameters to the launch program:
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch outside:=true 3_finger_gripper:=false
```
