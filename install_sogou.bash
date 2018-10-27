#!/bin/bash
GREEN_COLOR='\E[1;32m'
echo "Installing sogoupinyin for ubuntu 16.04."
sudo sed -i '$a\deb http://archive.ubuntukylin.com:10006/ubuntukylin xenial main' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install sogoupinyin 
<<<<<<< HEAD:install_sogou.bash
echo -e  "${GREEN_COLOR}============================== Click "+" ==============================${RES}"
echo -e  "${GREEN_COLOR}======Uncheck Only Show Current Language And Search "Sogou"!!!!!!======${RES}"
cd /usr/bin/
./fcitx-configtool 
=======
>>>>>>> 01e9a48c87bf920f920382e3ae769627d30cfa6d:install_sogou.bash
echo "sogoupinyin has been installed in your computer"
echo "If you can't find it,you need to restart your computer"
