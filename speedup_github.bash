#!/bin/bash
set -e # exit on first error
clear

main()
{
  reset_github_hosts
  update_github_hosts
}



reset_github_hosts()
{
  # delete old host matches
  echo "Delete old github hosts....."
  sudo sed -i '/github/d' /etc/hosts
}


update_github_hosts()
{

  # update the hosts for github
  echo "Add new github hosts....."
  sudo sh -c 'echo "# github" >> /etc/hosts'
  sudo sh -c 'echo "151.101.72.249 github.global.ssl.fastly.net" >> /etc/hosts'
  sudo sh -c 'echo "151.101.196.133 assets-cdn.github.com" >> /etc/hosts'
  sudo sh -c 'echo "151.101.76.133 avatars0.githubusercontent.com" >> /etc/hosts'
  sudo sh -c 'echo "151.101.76.133 avatars1.githubusercontent.com" >> /etc/hosts'
  sudo sh -c 'echo "151.101.72.133 documentcloud.github.com" >> /etc/hosts'
  sudo sh -c 'echo "107.22.242.220 status.github.com" >> /etc/hosts'
  sudo sh -c 'echo "192.30.255.112 www.github.com" >> /etc/hosts'
  sudo sh -c 'echo "151.101.76.133 raw.github.com" >> /etc/hosts'
  sudo sh -c 'echo "151.101.72.133 help.github.com" >> /etc/hosts'
  echo "The github hosts update is done."
}


main
