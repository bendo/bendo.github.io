---
title: "Arch Linux Installation and Configuration on UEFI Machines"
desc: "Short guide to install Arch Linux."
---

Short guide to install Arch Linux.

### boot live arch distro and connect to wifi
`# wifi-menu`  
`# ping -c 3 www.tuke.sk`  

### prepare disks
`# cgdisk /dev/nvme0n1`
 
 - 300M - EFI System - ef00
 - 460G - Linux filesystem - 8300
 - 16G  - Linux swap - 8200
 
### create file system
`# mkfs.fat -F32 /dev/nvme0n1p1`  
`# mkfs.ext4 /dev/nvme0n1p2`  
`# mkswap /dev/nvme0n1p3`  
`# swapon /dev/nvme0n1p3`  
let's check  
`# lsblk /dev/nvme0n1`

### mount the root partition
`# mount /dev/nvme0n1p2 /mnt`

### choose mirror
choose the mirror closest to your location  
copy the link of the locations closest to you and past it on top of the list  
`# vi /etc/pacman.d/mirrorlist`

enable Arch Multilib support for the live system by uncommenting the following lines from `/etc/pacman.conf` file:  
```
[multilib]
Include = /etc/pacman.d/mirrorlist
```

### install the base packages
`# pacstrap -i /mnt base base-devel`

if there is issue with signiture of some packages run:  
`# pacman -Sy archlinux-keyring`

### configure fstab
`# genfstab -U -p /mnt >> /mnt/etc/fstab`  
let's check  
`# cat /mnt/etc/fstab`  
chroot into your newly installed system to configure it  
`# arch-chroot /mnt`

### language and location settings
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

### let's set the time
first find the correct zone    
`# ls /usr/share/zoneinfo/`  
so right now it will be  
`# ln -s /usr/share/zoneinfo/Europe/Berlin /etc/localtime`  
let's configure hardware clock  
`# hwclock --systohc --utc`  
hostname  
`# echo shami > /etc/hostname`

### configure repositories
for 64bit system we need enable the appropriate repositories  
`# vi /etc/pacman.conf`  
uncoment the 'multilib' repo:  

```python
[multilib]  
Include = /etc/pacman.d/mirrorlist
```

now it's the best time to update repositories  
`# pacman -Sy`

### create users
first let's set up password for root  
`# passwd`  
now we will create new user  
`# useradd -mg users -G wheel,storage,power -s /bin/bash bendo`  
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

### install boot loader
`# pacman -S grub efibootmgr dosfstools os-prober mtools`  
`# mkdir /boot/EFI`  
`# mount /dev/nvme0n1p1 /boot/EFI  #Mount FAT32 EFI partition`  
`# grub-install --target=x86_64-efi  --bootloader-id=grub_uefi --recheck`  
`# grub-mkconfig -o /boot/grub/grub.cfg`  

### set up internet
`# pacman -S dialog`  
`# pacman -S netctl`  
`# pacman -S wpa_supplicant`  

### let's reboot
exit from chroot environment:  
`# exit`  
unmount the root  
`# umount -R /mnt`  
and reboot  
`# reboot`

### after boot
for `reboot` without sudo install `polkit`

install some apps:  
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

aur:  
`google-chrome, ttf-font-awesome-4, xbanish, xkb-switch, spotify, boostnote`

to sync time:  
`ntp` -> start and enable `ntpd`

check: `.xinitrc, bin/status-keyboard, bin/status-vol, .xmobarrc, .vimrc`

copy [dotfiles](https://github.com/bendo/dotfiles) (.bashrc, .xinitrc ...)  
