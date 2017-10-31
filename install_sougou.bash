#!/bin/bash
echo "ready install sogoupinyin for ubuntu 16.04."
sudo sed -i '$a\deb http://archive.ubuntukylin.com:10006/ubuntukylin trusty main' /etc/apt/sources.list
sudo apt-get update
sudo apt-get install sogoupinyin 
echo "sogoupinyin has been installed in your computer"
echo "if you can't find it,you need to restart your computer"
