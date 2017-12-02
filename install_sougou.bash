#!/bin/bash
echo "Installing sogoupinyin for ubuntu 16.04."
sudo sed -i '$a\deb http://archive.ubuntukylin.com:10006/ubuntukylin trusty main' /etc/apt/sources.list
sudo apt-get -qq update
sudo apt-get install sogoupinyin 
echo "sogoupinyin has been installed in your computer"
echo "If you can't find it,you need to restart your computer"
