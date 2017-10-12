#!/bin/bash
set -e  # exit on first error
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
UBUNTU_CODENAME=$(lsb_release -sc)


main()
{
   if [ "${UBUNTU_CODENAME}" == "xenial" ]; then
      echo "Updating to BIT's sources list.........."
      update_sourceslist
      echo "Done!"
   else
      echo "This is a script only for ubuntu 16.04."
   fi
  
}


update_sourceslist()
{
   cd /etc/apt
   sudo mv sources.list sources.list.bak
   cd $SCRIPT_DIR
   sudo cp -rf sources.list /etc/apt
   sudo apt-get update 

}

main
