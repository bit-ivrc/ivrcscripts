#!/bin/bash
set -e  # exit on first error

main()
{
  install_texLive2017
  
  install_texStudio
}

install_texLive2017()
{
  echo "Installing TeXLive2017 for ubuntu 16.04."
 
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

  # check if the texlive2017 is installed 
  if [ -n "$(find /usr/local/texlive/2017/bin/x86_64-linux -name 'tex' | head -1)" ]; then
     echo "The texlive2017 exists in '/usr/local/texlive'"
  else 
     echo "Installing texlive2017 to '/usr/local'........"
  
     cd ~/tex

     sudo ./install-tl
  fi

  # configure the texlive path env
  if ( grep 'export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' ~/.bashrc); then 
     echo "The texlive path env variables have been set." 
  else
     echo "Set the path env for texlive2017.........."
     
     sudo sed -i '$a\export MANPATH=${MANPATH}:/usr/local/texlive/2017/texmf-dist/doc/man' ~/.bashrc

     sudo sed -i '$a\export INFOPATH=${INFOPATH}:/usr/local/texlive/2017/texmf-dist/doc/info' ~/.bashrc

     sudo sed -i '$a\export PATH=${PATH}:/usr/local/texlive/2017/bin/x86_64-linux' ~/.bashrc

     export PATH=$PATH:/usr/local/texlive/2017/bin/x86_64-linux
  fi
 
  echo "TeXLive is installed on your computer."

}


vercmp() {
    version1=$1 version2=$3 condition=$2

    IFS=. v1_array=($version1) v2_array=($version2)
    v1=$((v1_array[0] * 100 + v1_array[1] * 10 + v1_array[2]))
    v2=$((v2_array[0] * 100 + v2_array[1] * 10 + v2_array[2]))
    diff=$((v2 - v1))
    [[ $condition = '='  ]] && ((diff == 0)) && return 0
    [[ $condition = '!=' ]] && ((diff != 0)) && return 0
    [[ $condition = '<'  ]] && ((diff >  0)) && return 0
    [[ $condition = '<=' ]] && ((diff >= 0)) && return 0
    [[ $condition = '>'  ]] && ((diff <  0)) && return 0
    [[ $condition = '>=' ]] && ((diff <= 0)) && return 0
    return 1
}


install_texStudio()
{
  ver=`texstudio --version | perl -pe '($_)=/([0-9]+([.][0-9]+)+)/'`
  if vercmp "$ver" ">=" "2.12.6" ; then 
     echo 'Your texstudio is up-to-date.'
  else 
     echo "Installing TeXStudio for ubuntu 16.04........"
     wget -O texstudio-qt5.deb http://download.opensuse.org/repositories/home:/jsundermeyer/xUbuntu_16.04/amd64/texstudio_2.12.6-5+5.1_amd64.deb
     sudo dpkg --install --force-overwrite texstudio-qt5.deb && rm -rf texstudio-qt5.deb
     echo "TeXStudio is installed on your computer."
  fi
  #texstudio && pkill -f 'texstudio'

  #echo "The texstudio will be configured"

  #The string that we are looking for
  #str1="Tools\\\\Commands\\\\bibtex="
  #str2="Tools\\\\Commands\\\\latex="
  #str3="Tools\\\\Commands\\\\pdflatex="
  #str4="Tools\\\\Commands\\\\xelatex="
  #str5="Tools\\\\Commands\\\\lualatex="
  #str6="Tools\\\\Commands\\\\compile="

  #New string
  #newstr1="Tools\\\\Commands\\\\bibtex=/usr/local/texlive/2017/bin/x86_64-linux/bibtex %.aux"
  #newstr2="Tools\\\\Commands\\\\latex=\"/usr/local/texlive/2017/bin/x86_64-linux/latex -src -interaction=nonstopmode %.tex\""
  #newstr3="Tools\\\\Commands\\\\pdflatex=\"/usr/local/texlive/2017/bin/x86_64-linux/pdflatex -synctex=1 -interaction=nonstopmode %.tex\""
  #newstr4="Tools\\\\Commands\\\\xelatex=\"/usr/local/texlive/2017/bin/x86_64-linux/xelatex -synctex=1 -interaction=nonstopmode %.tex\""
  #newstr5="Tools\\\\Commands\\\\lualatex=\"/usr/local/texlive/2017/bin/x86_64-linux/lualatex -synctex=1 -interaction=nonstopmode %.tex\""
  #newstr6="Tools\\\\Commands\\\\compile=txs:///xelatex"

  #Get the line number of the line that contains the certain string
  #Print the line number
  #Delete the certain line
  #Add the new string to the certain line

  #line1=`sed -n "/$str1/=" ~/.config/texstudio/texstudio.ini`
  #echo $line1
  #sed -i "$line1 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line1 i$newstr1" ~/.config/texstudio/texstudio.ini

  #line2=`sed -n "/$str2/=" ~/.config/texstudio/texstudio.ini`
  #echo $line2
  #sed -i "$line2 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line2 i$newstr2" ~/.config/texstudio/texstudio.ini

  #line3=`sed -n "/$str3/=" ~/.config/texstudio/texstudio.ini`
  #echo $line3
  #sed -i "$line3 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line3 i$newstr3" ~/.config/texstudio/texstudio.ini

  #line4=`sed -n "/$str4/=" ~/.config/texstudio/texstudio.ini`
  #echo $line4
  #sed -i "$line4 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line4 i$newstr4" ~/.config/texstudio/texstudio.ini

  #line5=`sed -n "/$str5/=" ~/.config/texstudio/texstudio.ini`
  #echo $line5
  #sed -i "$line5 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line5 i$newstr5" ~/.config/texstudio/texstudio.ini

  #line6=`sed -n "/$str5/=" ~/.config/texstudio/texstudio.ini`
  #echo $line6
  #sed -i "$line6 d" ~/.config/texstudio/texstudio.ini
  #sed -i "$line6 i$newstr6" ~/.config/texstudio/texstudio.ini
}

main
