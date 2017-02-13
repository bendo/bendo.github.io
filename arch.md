---
layout: page
title: Arch
permalink: /arch/
---

Short guide to install Arch Linux.

#### boot live arch distro  
`# wifi-menu`  
`# ping -c 3 www.tuke.sk`  

#### prepare disks
`# cgdisk /dev/sda`
 
 - first partition 1007K - ef02 (BIOS Boot Partition)
 - second partition 250G - 8300 (/root)
 - third partition 4G - 8200 (swap)
 
#### create file system
`# mkfs.ext4 /dev/sda2`  
`# mkswap /dev/sda3`  
`# swapon /dev/sda3`  
let's check  
`# lsblk /dev/sda`

#### mount the root partition
`# mount /dev/sda2 /mnt`

#### choose mirror
choose the mirror closest to your location  
copy the link of the locations closest to you and past it on top of the list  
`# vi /etc/pacman.d/mirrorlist`

#### install the base packages
`# pacstrap -i /mnt base base-devel`

#### configure fstab
`# genfstab -U -p /mnt >> /mnt/etc/fstab`  
let's check  
`# vi /mnt/etc/fstab`  
chroot into your newly installed system to configure it  
`# arch-chroot /mnt`

#### language and location settings
`# vi /etc/locale.gen`  

uncoment:

```python
en_US.UTF-8
de_DE.UTF-8
sk_SK.UTF-8
```

generate the locals:  
`# locale-gen`  
`# echo LANG=en_US.UTF-8 > /etc/locale.conf`    
`# export LANG=en_US.UTF-8`  

#### let's set the time
first find the correct zone    
`# ls /usr/share/zoneinfo/`  
so right now it will be  
`# ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime`  
let's configure hardware clock  
`# hwclock --systohc --utc`  
hostname  
`# echo shami > /etc/hostname`

#### configure repositories
for 64bit system we need enable the appropriate repositories  
`# vi /etc/pacman.conf`  
uncoment the 'multilib' repo:  

```python
[multilib]  
Include = /etc/pacman.d/mirrorlist
```

now it's the best time to update repositories  
`# pacman -Sy`

#### create users
first let's set up password for root  
`# passwd`  
now we will create new user  
`# useradd -m -g users -G wheel,storage,power -s /bin/bash bendo`  
let's set him password  
`# passwd bendo`  
now we will give him sudo superpowers  
`# pacman -S sudo`  
probably sudo is already instaled  
`# EDITOR=vi visudo`  
uncoment this line  
`%wheel ALL=(ALL) NOPASSWD: ALL`  
nice to have  
`# pacman -S bash-completion`

#### install boot loader
`# pacman -S grub`  
`# grub-install --target=i386-pc --recheck /dev/sda`  
for searching an another distros install  
`# pacman -S os-prober`  
run this so arch knows about other distros:  
`# grub-mkconfig -o /boot/grub/grub.cfg`

#### set up internet
`# pacman -S dialog`  
`# pacman -S netctl`  
`# pacman -S wpa_supplicant`  

#### let's reboot
exit from chroot environment:  
`# exit`  
unmount the root  
`# umount -R /mnt`  
and reboot  
`# reboot`

#### after boot
install some apps:  
`# pacman -S i3`  
`# pacman -S xorg`  
`# pacman -S xorg-server`  
`# pacman -S xorg-xinit`  
`# pacman -S vim`  
`# pacman -S scrot`  
`# pacman -S xloadimage`  
`# pacman -S imagemagick`  
`# pacman -S rxvt-unicode`  
`# pacman -S dmenu`  
`# pacman -S mplayer`  
`# pacman -S mc`  
`# pacman -S gedit`  
`# pacman -S zathura`  
copy [dotfiles](https://github.com/bendo/dotfiles) (.bashrc, .xinitrc ...)  
