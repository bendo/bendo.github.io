---
layout: page
title: Pi
desc: Guide to install Arch Linux on raspberry Pi. Plus Unicorn HAT and Scroll pHAT.
---

Installation of arch linux on raspberry pi.  
<https://wiki.archlinux.org/index.php/Raspberry_Pi>

#### prepare sd card
<https://archlinuxarm.org/platforms/armv8/broadcom/raspberry-pi-3>


#### prepare system after first boot
 - change root password and update system  
   `# passwd`  
   `# pacman -Syu`

 - add new user, login as new user and remove old one  
   `# useradd -m -G wheel -s /bin/bash bendo`  
   `# passwd bendo`  
   `# userdel -r alarm`

 - install some packages  
   `# pacman -S sudo vim rxvt-unicode netctl htop mc python python-pip python-psutil wget git base-devel`

 - allow group wheel to use sudo  
   `# visudo`

 - name for computer  
   `# echo pi02 > /etc/hostname`

 - dot files  
   `# git clone https://github.com/bendo/dotfiles.git`  
   `# cd dotfiles`  
   `# cp .bashrc ..`  
   logout, login  
   `# cp .vimrc ..`  
   `# cp -r .vim/ ..`  
   `# cp .Xresources ..`  
   `# vim .vimrc`  
   in vim `:PlugInstall`

 - wifi  
   `sudo wifi-menu`  
   use profile, then enable profile  
   `sudo netctl enable istria`

#### Unicorn HAT
 - clone repo and install  
   `# git clone https://github.com/bendo/unicorn-hat.git`

 - install rpi-ws281x  
   `# cd unicorn-hat/python/rpi-ws281x/`  
   `# sudo python setup.py build`  
   `# sudo python setup.py install`

 - install unicorn hat  
   `# cd ../UnicornHat/`  
   `# sudo python setup.py build`  
   `# sudo python setup.py install`


#### Scroll pHAT
 - clone repo and install  
   `# git clone https://github.com/pimoroni/scroll-phat.git`

 - install  
   `# sudo pip install cffi`  
   `# sudo pip install smbus-cffi`  
   `# sudo pip install scrollphat`  
   `# sudo pip install requests`  
   `# sudo pip install psutil`

 - configure i2c  
   in `# /boot/config.txt` add:   
   `dtparam=i2c_arm=on`  
   in `# /etc/modules-load.d/raspberrypi.conf` add:   
   `i2c-dev`  
   `i2c-bcm2708`  
   then reboot

 - check if it works  
   `# sudo i2cdetect -y 1`
