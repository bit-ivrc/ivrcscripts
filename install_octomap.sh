#!/bin/bash

set -e
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main() 
{
	install_octomap
}


install_octomap(){
  	#echo "Changing to BIT sources ..."
  	#bash $SCRIPT_DIR/install_bit_source_list.bash
	echo "Installing Octomap ..."
	git clone https://github.com/OctoMap/octomap.git
        sudo apt-get update
	sudo apt-get -y install build-essential cmake doxygen libqt4-dev \
	libqt4-opengl-dev libqglviewer-dev-qt4
	cd octomap && mkdir -p build && cd build
    	cmake -DWITH_CXX="ON" ..
    	make -j$(nproc)
    	sudo make install
	cd ../..
	rm -rf octomap
	echo "octomap installed successfully"
}


install_octomap
