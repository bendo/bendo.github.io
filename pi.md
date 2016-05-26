---
layout: page
title: Pi
permalink: /pi/
---

Installation of arch linux on raspberry pi.

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
   `# pacman -S sudo vim rxvt-unicode netctl htop mc python python-pip wget git base-devel`
 
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
 
 