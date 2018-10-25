#!/bin/bash
set -e  # exit on first error

# this is a script to install grid-map from source codes

main()
{
  identify_environment

  sudo apt-get install -qq ros-$ROS_DISTRO-pcl-ros ros-$ROS_DISTRO-costmap-2d

  if [ ! -d $CATKIN_WS ]; then
    echo "$HOME/catkin_ws does not exist! create ..."
    mkdir $CATKIN_WS
  fi
  if [ ! -d $CATKIN_WS/src ]; then
    echo "$HOME/catkin_ws/src does not exist! create ..."
    mkdir $CATKIN_WS/src
  fi

  cd $CATKIN_WS/src
  if [ "$ROS_DISTRO" == "kinetic" ]; then
    sudo apt-get install ros-$ROS_DISTRO-grid-map
  fi
  echo "grid_map is installed successfully!"
}

identify_environment()
{
    UBUNTU_CODENAME=$(lsb_release -s -c)
    case $UBUNTU_CODENAME in
      xenial)
        ROS_DISTRO=kinetic;;
      *)
        echo "Unsupported version of Ubuntu detected. Only xenial (16.04.*) are currently supported."
        exit 1
    esac
    REPO_DIR=$(dirname "$SCRIPT_DIR")
    CATKIN_WS="$HOME/catkin_ws"
}

main
