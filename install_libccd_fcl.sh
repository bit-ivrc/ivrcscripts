#!/bin/bash
set -e  # exit on first error
DIR=/tmp

main()
{
#  install_libccd
  install_fcl
}


install_libccd()
{
  if (ldconfig -p | grep libccde); then
    echo "libccd has been installed."
  else
    echo "Install libccd......"
    cd $DIR
    rm -rf libccd
    git clone --branch v2.0 https://github.com/danfis/libccd.git
    cd libccd
    mkdir -p build && cd build
    cmake -G "Unix Makefiles" -DBUILD_SHARED_LIBS=ON -DENABLE_DOUBLE_PRECISION=ON .. > /dev/null
    make && sudo make install > /dev/null
    echo "libccd is installed succesfully."
  fi
}

install_fcl()
{
  sudo apt-get install -y liboctomap-dev
  if (ldconfig -p | grep libfcli); then
    echo "fcl has been installed."
  else
    echo "Install fcl......."
    cd $DIR
    rm -rf fcl
    git clone --branch 0.5.0 https://github.com/flexible-collision-library/fcl.git
    cd fcl
    mkdir -p build && cd build
    cmake -DCMAKE_BUILD_TYPE=Release -DFCL_TREAT_WARNINGS_AS_ERRORS=ON ..
    make -j4 > /dev/null
    sudo -E make install > /dev/null
    echo "fcl is installed successfully."
  fi
}

main
