#!/bin/bash

set -e # exit on first error

install_nlopt()
{

    echo "Prepare to install NLopt ..."
    cd /tmp && rm -rf nlopt*
    git clone https://github.com/stevengj/nlopt.git
    cd nlopt && mkdir -p build && cd build
    cmake -DWITH_CXX="ON" ..
    make -j$(nproc)
    sudo make install
}

install_nlopt
