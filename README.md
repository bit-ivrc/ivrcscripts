# ivrcscripts[![Build Status](https://travis-ci.com/bit-ivrc/ivrcscripts.svg?token=Jmj6MSYSGZmX9ePjdawa&branch=master)](https://travis-ci.com/bit-ivrc/ivrcscripts)
Various useful scripts for
* Ubuntu 16.04 LTS
* ROS Kinetic.


## Usage

```
./installers/<*>.sh
```

## Status and Description

| installers | status  | dependencies | version | description |
| ------ | ------ | :------: | :-------: | -------- |
| 1.`install_bit_source_list.sh` | [![job1][1]][0] | BIT campus network | latest | Update [sources.list](http://wiki.ubuntu.org.cn/%E6%A8%A1%E6%9D%BF:16.04source) with the BIT apt Mirror|
| 2.`install_ceres.sh`    | [![job2][2]][0]  |  -- | 1.12.0 | [Google Ceres Solver](http://ceres-solver.org/) |
| 3.`install_cppad.sh`    | [![job3][3]][0]  | -- | 20180000.0 | [Automatic Differentiation Library](http://coin-or.github.io/CppAD/doc/cppad.htm) |
| 4.`install_github_lfs.sh`    | [![job4][4]][0]  | -- | 2.3.4 | [Git Large File Storage](https://git-lfs.github.com/) Support |
| 5.`install_gtest.sh`    | [![job5][5]][0]  | -- | latest | [Google Unit Test Library](https://github.com/google/googletest) |
| 6.`install_libccd_fcl.sh`    | [![job6][6]][0]  | -- | ccd:2.0, fcl:0.5.0 | Collision Checking Library, [FCL](https://github.com/flexible-collision-library/fcl), [CCD](https://github.com/danfis/libccd) |
| 7.`install_nlopt.sh`    | [![job7][7]][0]  | -- | latest | [Nonlinear Programming Solver](https://nlopt.readthedocs.io/en/latest/) |
| 8.`install_sogou.sh`    | [![job8][8]][0]  | -- | latest | [Pinyin Input Method](https://pinyin.sogou.com/linux/?r=pinyin) |
| 9.`install_wubi.sh`    | [![job9][9]][0]  | -- | latest | [Wubi Input Method](https://fcitx-im.org/wiki/Fcitx/zh-hans) |
| 10.`install_vrep.sh`    | [![job10][10]][0]  | -- | v3.4.0 | [A General 3D Simulator for Robotics](http://www.coppeliarobotics.com/).|
| 11.`install_ros.sh`    | [![job11][11]][0]  | ubuntu 16.04 | kinetic | [Robot Operating System](http://www.ros.org/) |
| 12.`install_geographic.sh`    | [![job12][12]][0]  | -- | dev | [A Library for Solving Geodesic Problems](https://geographiclib.sourceforge.io/).|
| 13.`install_grid_map.sh`    | [![job13][13]][0]  | install_ros.sh | 1.6.0 | [A Grid Map Library](https://github.com/anybotics/grid_map) |
| 14.`install_ipopt.sh`    | [![job14][14]][0]  | -- | 3.12.4 | [Nonliner Programming Solver](https://projects.coin-or.org/Ipopt) |


See [wiki](https://github.com/bit-ivrc/ivrcscripts/wiki) for more useful information.

[0]: https://travis-ci.org/bit-ivrc/ivrcscripts
[1]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/1
[2]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/2
[3]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/3
[4]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/4
[5]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/5
[6]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/6
[7]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/7
[8]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/8
[9]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/9
[10]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/10
[11]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/11
[12]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/12
[13]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/13
[14]: https://travis-matrix-badges.herokuapp.com/repos/bit-ivrc/ivrcscripts/branches/master/14
