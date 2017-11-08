#!/bin/bash
set -e  # exit on first error

echo "Installing TeXLive2017 for ubuntu 16.04."

sudo wget -p /home/ http://mirror.bit.edu.cn/CTAN/systems/texlive/Images/texlive2017.iso 

cd /home/

sudo mkdir /home/tex

mount -t iso9660 texlive2017.iso -o rw /home/tex

cd tex

sudo ./install-tl

sudo sed -i '$a\export MANPATH=${MANPATH}:/usr/local/texlive/2017/texmf-dist/doc/man' ~/.bashrc

sudo sed -i '$a\export INFOPATH=${INFOPATH}:/usr/local/texlive/2017/texmf-dist/doc/info' ~/.bashrc

sudo sed -i '$a\export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' ~/.bashrc

export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux

echo "TeXLive is installed on your computer."

echo "Installing TeXStudio for ubuntu 16.04."

sudo sudo apt -qq install texstudio

echo "TeXStudio is installed on your computer."

exit 0
