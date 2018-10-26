#!/usr/bin/bash

main() 
{
  install_gtest
}


install_gtest()
{
  sudo apt-get update
  sudo apt-get install -qq libgtest-dev
}

main


