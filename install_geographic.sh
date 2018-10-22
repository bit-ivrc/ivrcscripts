#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{
    echo "Installing geographiclib from source ........."
    identify_environment
    install_geographic_from_source
}


install_geographic_from_source()
{
    GEOGRAPHICLIB_VERSION="1.49"
    GEOGRAPHICLIB_URL="https://sourceforge.net/projects/geographiclib/files/distrib/GeographicLib-$GEOGRAPHICLIB_VERSION.tar.gz"
    GEOGRAPHICLIB_DIR="GeographicLib-$GEOGRAPHICLIB_VERSION"

    if (ldconfig -p | grep -q libGeographic.so.17 ); then
        echo "GeographicLib version $GEOGRAPHICLIB_VERSION is already installed."
    else
        echo "Installing GeographicLib version $GEOGRAPHICLIB_VERSION ..."
        cd /tmp
        rm -rf $GEOGRAPHICLIB_DIR
        wget --no-check-certificate "$GEOGRAPHICLIB_URL"
        tar -xf "GeographicLib-$GEOGRAPHICLIB_VERSION.tar.gz"
        rm -rf "GeographicLib-$GEOGRAPHICLIB_VERSION.tar.gz"
        cd "$GEOGRAPHICLIB_DIR"
        mkdir -p BUILD
        cd BUILD
        cmake ..
        make 
        sudo make install > /dev/null
    fi
}

# get UBUNTU_CODENAME, ROS_DISTRO, REPO_DIR, CATKIN_DIR
identify_environment()
{
    UBUNTU_CODENAME=$(lsb_release -s -c)
    case $UBUNTU_CODENAME in
      trusty)
        ROS_DISTRO=indigo;;
      xenial)
        ROS_DISTRO=kinetic;;
      *)
        echo "Unsupported version of Ubuntu detected. Only trusty (14.04.*) and xenial (16.04.*) are currently supported."
        exit 1
    esac
    REPO_DIR=$(dirname "$SCRIPT_DIR")
    CATKIN_DIR="$HOME/catkin_ws"
}

main
