# rbeken_sim_bringup

Launch files that launch the complete simulation of the robot/s.

## Start the simulation

The default simulation of the RB-Eken can be launched with the following command:

```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch
```

There are some arguments* that allows you to modify the simulation environment or the configuration of the robot.

*You can combine them to customize the simulation

The default simulation runs a RB-Eken equipped with rubber wheels (skid), an UR10 and a 2-fingers gripper. In this case, the simulation is using the inside world. 

&nbsp;
### Gazebo world

The argument `world` sets which gazebo world will be used for the simulation. There are two available worlds: [inside](../rbeken_gazebo/worlds/rbeken_inside.world) and [outside](../rbeken_gazebo/worlds/rbeken_outside.world). 

#### Using inside world


```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch world:=worlds/rbeken_inside.world
```

#### Using outside world
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch world:=worlds/rbeken_inside.world
```

&nbsp;
### Robot kinematics

The  `kinematics` argument sets whether the robot can perform omnidirectional movements or whether it will be a differential base. There are two available kinematics: omni and skid.

The `robot_xacro` argument sets which gazebo model is used for the robot simulation. The available robot models are in [rbeken_description](https://github.com/RobotnikAutomation/rbeken_common/tree/master/rbeken_description/robots) package. If you want to perform omnidirectional movements, the robot_xacro should contain mecanum wheels.

#### Using omni kinematics
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch kinematics:=omni robot_xacro:=rbeken_mecanum.urdf.xacro
```

#### Using skid kinematics
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch kinematics:=skid robot_xacro:=rbeken_rubber.urdf.xacro
```

&nbsp;
### Gripper

The `gripper_controllers` is a list of controllers loaded to perform movements with the gripper. Each controller must have the *gripper/* prefix. The controllers must be defined as a list separated by a blank space. Now there are two different controllers configured: gripper_controller (for the 3-fingers gripper) and robotiq_85_position_controller (for the 2-fingers gripper).

The `robot_xacro` argument must be also set to fit with the desired `gripper_controllers`. The available robot models are in [rbeken_description](https://github.com/RobotnikAutomation/rbeken_common/tree/master/rbeken_description/robots) package. If the model contains 3f in the name, a 3-fingers gripper will be loaded and the gripper_controllers must be gripper/gripper_controller. Otherwise a 2-finguer gripper will be loaded, so the girpper_controllers must be gripper/robotiq_85_position_controller.

For example, to launch a RB-Eken with rubber wheels and a 3-fingers gripper:
```bash
roslaunch rbeken_sim_bringup rbeken_complete.launch kinematics:=skid robot_xacro:=rbeken_rubber_3f.urdf.xacro gripper_controllers:=gripper/gripper_controller
```

&nbsp;

## Funcionalities

Using the simulation you can map an environment, navigate through it and localize the robot in the map.

### Mapping

You can create a map using the following command:

```bash
ROS_NAMESPACE=robot roslaunch rbeken_localization slam_gmapping.launch 
```

Once you have completed the map, you need to save it (using an addition console):

```bash
ROS_NAMESPACE=robot roslaunch rbeken_localization map_saver.launch 
```

By default the map will be saved in the home directory.

### Localization

First you will need to launch a map server:

```bash
ROS_NAMESPACE=robot roslaunch rbeken_localization map_server.launch map_file:=simulation_inside/simulation_inside.yaml
```

Then run the localization:

* If you are using skid configuration:
```bash
ROS_NAMESPACE=robot roslaunch rbeken_localization amcl.launch 
```

* If you are using omni configuration:
```bash
ROS_NAMESPACE=robot roslaunch rbeken_localization amcl.launch odom_model_type:=omni
```

### Navigation

Depending on the kinematics configuration:
* If you are using skid configuration:
```bash
ROS_NAMESPACE=robot roslaunch rbeken_navigation move_base.launch
```

* If you are using omni configuration:
```bash
ROS_NAMESPACE=robot roslaunch rbeken_navigation move_base.launch differential_robot:=false
```