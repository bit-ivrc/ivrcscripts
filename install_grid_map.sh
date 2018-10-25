#!/bin/bash
set -e  # exit on first error
UBUNTU_CODENAME=$(lsb_release -sc)
CATKIN_WS=$HOME/catkin_ws
# this is a script to install grid-map from source codes

main()
{
  if [ "$UBUNTU_CODENAME" == "xenial" ]; then
    ROS_DISTRO="kinetic"
  elif [ "$UBUNTU_CODENAME" == "trusty" ]; then
    ROS_DISTRO="indigo"
  fi

  sudo apt-get install -qq ros-$ROS_DISTRO-pcl-ros ros-$ROS_DISTRO-costmap-2d

  if [ ! -d $CATKIN_WS ]; then
    echo "catkin_ws does not exist! create ..."
    mkdir $CATKIN_WS
  fi
  if [ ! -d $CATKIN_WS/src ]; then
    echo "catkin_ws/src does not exist! create ..."
    mkdir $CATKIN_WS/src
  fi

  cd $CATKIN_WS/src
  if [ "$ROS_DISTRO" == "kinetic" ]; then
    sudo apt-get install -qq ros-$ROS_DISTRO-grid-map
  elif [ "$ROS_DISTRO" == "indigo" ]; then
    if [ ! -d grid_map ];then
      git clone https://github.com/ethz-asl/grid_map.git
    else
      git -C grid_map pull
    fi
  fi
  }



main
