---
title:  "Installing Arch Linux on ASUS Zenbook 14"
tags: linux
---

Recently I bought ASUS Zenbook 14" (UX433FN-A6023T) and I installed my favorit Arch linux
on it.

![](../assets/imgs/asus.png)

# The specs:
- Intel(R) Core(TM) i7-8565U CPU @ 1.80GHz
- 16GB RAM
- Intel Corporation UHD Graphics 620 (Whiskey Lake)
- NVIDIA Corporation GP108M [GeForce MX150]
- 512 GB NvME SSD
- FHD IPS screen 1920×1080 14″
- 4200mAh battery
- supposed ~8hrs of on-the-battery-time
- Price paid: 1200 EUR

# Checking system
Notebook came with preinstalled Windows home. So first thing I've done, was to
check how everything works.

This is the list of thing which works on windows and should work in linux as well:

- camera face recognition
- wifi speed down: 200Mbps / up: 12Mbps (this is speed which I pay for)
- touchpad / numpad
- keyboard backlight
- suspend when notebook closed
- Fn + Esc should lock Fn
- all Fn related keys

# Arch Linux instalation
I have installed Arch linux and surprisingly a lot of stuff worked out of the box:

- wifi full speed
- keyboard backlight
- suspend to memory
- bluetooth
- touchpad (middle click was disabled)
- Intel graphic card

But few things didn't work:

- all Fn related keys
- touchpad middle click
- switching between Intel and GeForce graphic card

So next thing which I done was to fix these few issues.

# Touchpad
I just enabled middle click adding **xinput set-prop 14 305 1** line to **.xinitrc** file.   
**xinput** is a utility to configure and test X input devices, such as mouse,
keyboards and touchpads.
To list all xinput devices use: **xinput list**, where you can see that touchpad has id **14**.
To list all properties of touchpad we use: **xinput list-props 14**, where we found that 
**libinput Middle Emulation Enabled (305):** is setted to **0**. We can enable middle click with:
**xinput set-prop 14 305 1**. Thats it.
Please check [ArchWiki](https://wiki.archlinux.org/index.php/Libinput) for more details.

# Fn related keys
Only one Fn key which work out of the box is **F7** which controll backlight of keyboard.  
For rest of the keys I used **xbindkeys**.
In home directory I've created file **.xbindkeysrc** with content:
```
"pactl set-sink-volume @DEFAULT_SINK@ -1000"
    m:0x0 + c:122
    XF86AudioLowerVolume

"pactl set-sink-volume @DEFAULT_SINK@ +1000"
    m:0x0 + c:123
    XF86AudioRaiseVolume

"pactl set-sink-mute @DEFAULT_SINK@ toggle"
    m:0x0 + c:121
    XF86AudioMute
```
In **.xinitrc** add one more line **xbindkeys &** I didn't set up dimming yet. Will do later.
For more details check [ArchWiki](https://wiki.archlinux.org/index.php/Xbindkeys).

# Nvidia GeForce and Intel
Intel graphic works out of the box. At least there is no issue to watch HD movies and so on.  
But for better performance check **NVIDIA Optimus**. Right now there is no easy way to set 
up graphics to switch between them seemingly, so if you are not using as much graphic operation
I think it is ok to stay with Intel.
