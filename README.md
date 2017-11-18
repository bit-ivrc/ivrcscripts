# ivrcscripts
Common place for storing general install, setup, and other scripts.

## Usage

```
bash <*>.bash
```


## Instruction
* install_bit_source_list.bash   
This script will replace `/etc/apt/sources.list` with the sources mirror of BIT, which will speed up the software installation through `apt-get`.


* ros_install.bash  
This script will install the ROS according to your Ubuntu version automatically.

  ubuntu 14.04 : ROS Indigo   
  ubuntu 16.04 : ROS Kinetic   


* speedup_github.bash   
Speed up github access from China.


* install_ipopt.bash
Ipopt version: 3.12.4


* install_sogou.bash


* latex_install.bash
This script will install TeXlive2017 and TeXStudio.Make sure that you have replace /etc/apt/sources.list with the sources mirror of BIT. And there is at least 15G storage space in your /home directory.
After the software has been installed,you can see this [website](http://blog.csdn.net/up_com/article/details/51218458) can help you solve the problem of Chinese fonts.


See [wiki](https://github.com/bit-ivrc/ivrcscripts/wiki) for more useful information.
