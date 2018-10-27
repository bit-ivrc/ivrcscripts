#!/bin/bash
GREEN_COLOR='\E[1;32m'
echo "Installing sogoupinyin for ubuntu 16.04."
sudo sed -i '$a\deb http://archive.ubuntukylin.com:10006/ubuntukylin xenial main' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install sogoupinyin 
echo -e  "${GREEN_COLOR}============================== Click "+" ==============================${RES}"
echo -e  "${GREEN_COLOR}======Uncheck Only Show Current Language And Search "Sogou"!!!!!!======${RES}"
cd /usr/bin/
./fcitx-configtool 
echo "sogoupinyin has been installed in your computer"
echo "If you can't find it,you need to restart your computer"
