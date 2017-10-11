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
  sudo sh -c 'echo "151.101.72.133 assets-cdn.github.com" >> /etc/hosts'

  #sudo sh -c 'echo "$(dig +short github.com | grep -v "\.$" | head -n 1) github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short github.global.ssl.fastly.net | grep -v "\.$" | head -n 1) github.global.ssl.fastly.net" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short assets-cdn.github.com | grep -v "\.$" | head -n 1) assets-cdn.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short documentcloud.github.com | grep -v "\.$" | head -n 1) documentcloud.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short gist.github.com | grep -v "\.$" | head -n 1) gist.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short help.github.com | grep -v "\.$" | head -n 1) help.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short nodeload.github.com | grep -v "\.$" | head -n 1) nodeload.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short raw.github.com | grep -v "\.$" | head -n 1) raw.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short status.github.com | grep -v "\.$" | head -n 1) status.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short training.github.com | grep -v "\.$" | head -n 1) training.github.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short avatars0.githubusercontent.com | grep -v "\.$" | head -n 1) avatars0.githubusercontent.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short avatars1.githubusercontent.com | grep -v "\.$" | head -n 1) avatars1.githubusercontent.com" >> /etc/hosts'
  #sudo sh -c 'echo "$(dig +short www.github.com | grep -v "\.$" | head -n 1) www.github.com" >> /etc/hosts'
  echo "The github hosts update is done."
}


main
