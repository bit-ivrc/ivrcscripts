#!/bin/bash
set -e  # exit on first error
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{
  install_ros
  create_catkin_ws
}

install_ros()
{
  identify_environment

  sudo sh -c '. /etc/lsb-release && echo "deb http://mirrors.ustc.edu.cn/ros/ubuntu/ $DISTRIB_CODENAME main" > /etc/apt/sources.list.d/ros-latest.list'

  # check if there is a problem here
  sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116

  echo "Updating package lists ..."
  sudo apt-get -qq update --fix-missing
  echo "Installing ROS $ROS_DISTRO ..."
  sudo apt-get -y install ros-$ROS_DISTRO-desktop
  sudo apt-get -qq install python-catkin-tools > /dev/null
  sudo apt-get -qq install ros-$ROS_DISTRO-catkin > /dev/null

  # check if the ros setup file is sourced.
  if [ "$ROS_DISTRO" == "kinetic" ]; then
    if (grep 'source /opt/ros/kinetic/setup.bash' $HOME/.bashrc); then
      echo "The ros setup.bash has been sourced."
    else
      echo "source /opt/ros/kinetic/setup.bash" >> ~/.bashrc
    fi
  fi



  if [ "$ROS_DISTRO" == "kinetic" ]; then
      sudo apt-get -qq install ros-$ROS_DISTRO-opencv3 > /dev/null
  fi

  source /opt/ros/$ROS_DISTRO/setup.bash

  # Prepare rosdep to install dependencies.
  echo "Updating rosdep ..."
  if [ ! -d /etc/ros/rosdep ]; then
    sudo rosdep init > /dev/null
  fi

  rosdep update
  sudo apt-get -qq install python-rosinstall
}


create_catkin_ws()
{
    # Check if workspace exists
    if [ -e "$CATKIN_WS_DIR/.catkin_workspace" ] || [ -d "$CATKIN_WS_DIR/.catkin_tools" ]; then
        echo "Catkin workspace detected at ~/catkin_ws"
        rm -rf build devel install logs
    else
        echo "Creating catkin workspace in $HOME/catkin_ws ..."
        source /opt/ros/$ROS_DISTRO/setup.bash
        mkdir -p "$CATKIN_WS_DIR/src"
        cd "$CATKIN_WS_DIR"
        catkin init
        cd "$CATKIN_WS_DIR"
        catkin build
        echo "Catkin workspace created successfully."
    fi


    if (grep 'source ~/catkin_ws/devel/setup.bash' $HOME/.bashrc); then
      source $HOME/.bashrc
      echo "The ros catkin_ws/devel/setup.bash has been sourced."
    else
      echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
      source $HOME/.bashrc
    fi

}

# get UBUNTU_CODENAME, ROS_DISTRO, REPO_DIR, CATKIN_DIR
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
    CATKIN_WS_DIR="$HOME/catkin_ws"
}

# Install system dependencies listed in ROS packages' package.xml
# Note: dependencies needed on embedded systems must still be included
# separately in the repo or cross-compiled stage.

main
