#!/bin/bash
set -e  # exit on first error
OPENCV_URL=https://github.com/Itseez/opencv/archive/3.0.0-alpha.zip
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"


main()
{
  identify_environment
  if [ "$ROS_DISTRO" == "kinetic" ]; then
    echo "installing dependencies, download opencv, install opencv ......"
    install_dependencies
    download_opencv
    install_opencv
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
    CATKIN_DIR="$HOME/catkin_ws"
}

install_dependencies()
{
    echo "deb http://mirror.csclub.uwaterloo.ca/ubuntu/ trusty main multiverse" >> /etc/apt/sources.list
    sudo apt-get update
    sudo apt-get -y install -qq \
        libopencv-dev \
        build-essential \
        cmake \
        git \
        libgtk2.0-dev \
        pkg-config \
        python-dev \
        python-numpy \
        libdc1394-22 \
        libdc1394-22-dev \
        libjpeg-dev \
        libpng12-dev \
        libtiff*-dev \
        libjasper-dev \
        libavcodec-dev \
        libavformat-dev \
        libswscale-dev \
        libxine2-dev \
        libgstreamer0.10-dev \
        libgstreamer-plugins-base0.10-dev \
        libv4l-dev \
        libtbb-dev \
        libqt4-dev \
        libfaac-dev \
        libmp3lame-dev \
        libopencore-amrnb-dev \
        libopencore-amrwb-dev \
        libtheora-dev \
        libvorbis-dev \
        libxvidcore-dev \
        x264 \
        v4l-utils \
        unzip
}

download_opencv() {
    mkdir -p /usr/local/src/opencv
    cd /usr/local/src/opencv
    if [ ! -d opencv-3.0.0-alpha ]; then
        wget $OPENCV_URL -O opencv-3.0.0-alpha.zip
        unzip -qq opencv-3.0.0-alpha.zip
        rm opencv-3.0.0-alpha.zip
    fi
    cd -
}

install_opencv() {
    # compile and install opencv
    cd /usr/local/src/opencv
    mkdir -p /usr/local/src/opencv/install
    cd opencv-3.0.0-alpha
    mkdir -p build
    cd build
    cmake \
        -D CMAKE_BUILD_TYPE=RELEASE \
        -D CMAKE_INSTALL_PREFIX=/usr/local/src/opencv/install \
        -D WITH_TBB=ON \
        -D WITH_V4L=ON \
        -D WITH_QT=ON \
        -D WITH_OPENGL=ON ..
    make -j$(nproc)

    # DO NOT ACTUALLY INSTALL THIS WILL CAUSE PROBLEMS WITH
    # BUILDS THAT DEPEND ON OPENCV 2
    # THE REASON IS /usr/local/lib has precedence over /usr/lib
    sudo make install
}

# MAIN
main
