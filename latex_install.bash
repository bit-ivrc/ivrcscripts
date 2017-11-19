#!/bin/bash
set -e  # exit on first error
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

main()
{
  install_texLive2017
  
  install_texStudio
}

install_texLive2017()
{
  echo "Installing TeXLive2017 for ubuntu 16.04."
 
    # check if the texlive2017 is installed 
  if [ -n "$(find /usr/local/texlive/2017/bin/x86_64-linux -name 'tex' | head -1)" ]; then
     echo "The texlive2017 exists in '/usr/local/texlive'"
  else 
     echo "Installing texlive2017 to '/usr/local'........"
     ## purge the old version texlive
     sudo apt-get purge texlive*
     mkdir -p ~/tex
     # check if a file exists by absolute paths
     if [ -n "$(find ~/ -name 'texlive2017.iso' | head -1)" ]; then
         echo "texlive2017.iso has already been downloaded."
     else
         echo "texlive2017.iso will be downloaded."
         wget -P ~/ http://mirror.bit.edu.cn/CTAN/systems/texlive/Images/texlive2017.iso   
     fi

     # check if the iso file has been mounted 	
     if mount | grep ~/tex > /dev/null; then
         echo "The texlive2017.iso has already been mounted to ~/tex ."
     else
         echo "Mounting the texlive2017.iso to ~/tex."
         sudo mount -t iso9660 ~/texlive2017.iso -o rw ~/tex
     fi
     cd ~/tex
     echo "Start to install the texlive2017 with a customized profile"
     sudo ./install-tl -profile $SCRIPT_DIR/texlive.profile
     echo "TeXLive is installed on your computer."
     # configure the texlive path env
     if ( grep 'export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' ~/.bashrc); then 
         echo "The texlive path env variables have been set." 
     else
         echo "Set the path env for texlive2017.........."
     
         sudo sed -i '$a\export MANPATH=${MANPATH}:/usr/local/texlive/2017/texmf-dist/doc/man' ~/.bashrc

         sudo sed -i '$a\export INFOPATH=${INFOPATH}:/usr/local/texlive/2017/texmf-dist/doc/info' ~/.bashrc

         sudo sed -i '$a\export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' ~/.bashrc

         sudo sed -i '$a\PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux' /etc/environment
    
         source ~/.bashrc
     fi
  fi
}


install_texStudio()
{
    sudo apt-get purge texstudio* 
    echo "Installing TeXStudio for ubuntu 16.04........"
    wget -O texstudio-qt5.deb https://coding.net/u/aRagdoll/p/software_install/git/raw/master/texstudio_2.12.6-5%252B5.1_amd64.deb
    sudo apt-get -y install libpoppler-qt5-1 libqt5script5
    sudo dpkg --install --force-overwrite texstudio-qt5.deb && rm -rf texstudio-qt5.deb
    echo "TeXStudio is installed on your computer."
}

main
