# ivrcscripts[![Build Status](https://travis-ci.com/bit-ivrc/ivrcscripts.svg?token=Jmj6MSYSGZmX9ePjdawa&branch=master)](https://travis-ci.com/bit-ivrc/ivrcscripts)
Common place for storing general install, setup, and other scripts.

## Usage

```
./<*>.sh
```


## Instruction
* install_bit_source_list.sh   
This script will replace `/etc/apt/sources.list` with the sources mirror of BIT, which will speed up the software installation through `apt-get`.

* install_ceres.sh   
ceres version: 1.12.0

* install_cppad.sh  
CppAD version: 20180000.0

* install_ros.sh  
This script will install the ROS according to your Ubuntu version automatically.

  ubuntu 16.04 : ROS Kinetic   

* install_github_lfs.sh  
This script will install git lfs (Large File Storage), which replaces large files such as audio samples, videos, datasets, and graphics with text pointers inside Git, while storing the file contents on a remote server like GitHub.com or GitHub Enterprise.

* install_gtest.sh  
This script will install Google c++ unit test lib.

* install_libccd_fcl.sh  
libccd version: 2.0  
fcl version: 0.5.0

* install_nlopt.sh  
This script will install nlopt from source.

* install_octomap.sh  
This script will install the lastest version of [octomap](http://octomap.github.io/) from source.

* install_ipopt.sh  
Ipopt version: 3.12.4


* install_sougou.sh  
This script will install sougou pinyin.

* install_vrep.sh  
V-REP version: 3.4.0


* install_latex.sh  
This script will install TeXlive2018 and TeXStudio. It will also configure the environment of TeXStudio and install the Chinese fonts.    
Make sure that you have replace `/etc/apt/sources.list` with the sources mirror of BIT by running `install_bit_source_list.bash` script. And there is at least 15G storage space in your /home directory.    
Once the script has finished,restart the computer to make sure the software runs normally.     
The BIT LaTeX template mirror is on this [website](https://coding.net/u/aRagdoll/p/LaTex-template/git). It's way more faster cloning it from the mirror than from [the original github repo](https://github.com/BIT-thesis/LaTeX-template.git).  

* install_geographic.sh  


* install_grid_map.sh  

See [wiki](https://github.com/bit-ivrc/ivrcscripts/wiki) for more useful information.
