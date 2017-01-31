---
layout: post
title:  "Setting up airline-vim"
date:   2017-01-01 01:00:00 +0100
categories: vim
---
Install airline:\\
`Plug 'bling/vim-airline'`

Set airline powerline fonts in .vimrc:\\
`g:airline_powerline_fonts = 1`

Install fonts:
{% highlight shell %}
λ git clone https://github.com/powerline/fonts.git
λ cd fonts
λ ./install.sh
{% endhighlight  %}

Then in ~/.Xresources configure urxvt to use a powerline font:\\
`URxvt.font: xft:DejaVu Sans Mono for Powerline:size=9`

Then reloading the configuration:\\
`xrdb -merge ~/.Xresources`

And restart urxvtd:
{% highlight shell %}
λ killall urxvtd
λ urxvtd -q -o -f
{% endhighlight  %}
