#!/bin/bash
set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
# get UBUNTU_CODENAME, ROS_DISTRO, REPO_DIR, CATKIN_DIR
source $SCRIPT_DIR/identify_environment.bash



main()
{
    echo "Installing geographiclib from source ........."
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

main
