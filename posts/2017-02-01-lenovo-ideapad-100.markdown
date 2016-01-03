---
title:  "Lenovo ideapad 100 - Arch Linux"
tags: bios
---

Lenovo ideapad 100 needs some tweaking before we can enjoy it. 

# BIOS Hack
In BIOS change "OS Optimized Defaults" to "Win8 64bit" and loaded defaults. 

Disable Secure Boot, then change "OS Optimized Defaults" back to "Other OS" - but
do not load defaults.

Suspend, resume, reboot and shutdown should work well.

# SD Card Reader
Package [rts5139-git](https://aur.archlinux.org/packages/rts5139-git/) from AUR has to be installed.
