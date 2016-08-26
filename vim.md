---
layout: page
title: Vim
permalink: /vim/
---

#### Movement
  - **h j k l** &rarr; basic movement keys ... **10j**
  - **b w B W** &rarr; move back/forward by token/word
  - **_**       &rarr; jump to first character of line
  - **^**       &rarr; jump to first non-whitespace character of line 
  - **$**       &rarr; jump to end of the line
  - **ctrl+u ctrl+d** &rarr; page up, page down
  - \<line-number\>**G** &rarr; jump to a specific line number
  - **H M L** &rarr; move to the top/middle/bottom of the screen
  - **# &#42;** &rarr; find the previous/next occurrence of the token under the
    cursor
  - **n N** &rarr; repeat the last find command forward/backward
  - **''** &rarr; jump back to where you just were
  - **ctrl+o ctrl+i** move backward/forward through the jump history

#### Editing
  - **i a I A** &rarr; insert/append at/after cursor/beginning/end of line
  - **o O** &rarr; open new line below/above the current line
  - **o**\<esc\> &rarr; add a blank line
  - **cw cW** &rarr; correct token/world following the cursor
  - **cc** &rarr; correct line by clearing and then entering insert mode
  - **dd** &rarr; delete line
  - **ct cf ci ca** &rarr; correct up to or including specific characters
  - **dt df di da** &rarr; delete up to or including specific characters
  - **s** &rarr; delete character at the cursor ant then enter insert mode **5s**
  - **yy** &rarr; copy line
  - **yw yW** &rarr; copy token/word
  - **p P** &rarr; paste before/after cursor
  - **u ctrl+r** &rarr; undo and redo
  - **.** &rarr; repeat the previous edit command
  - **>aB** &rarr; indent a Block


#### Correcting Text
  Combination with **c** or **d**
  - **t**\<char\> exclusive match: continue up to the next \<char\> on this line
  - **f**\<char\> inclusive match: continue up to the next \<char\> on this line
  - **i**\<char\> exclusive inner match: apply to the text bounded by \<char\>
  - **a**\<char\> inclusive inner match: apply to the text bounded by \<char\>

  Say that I have the code below, and I want to completely replace the code
  inside the map() with something else:

  `signal.map(count -> String.format(“%d cookies, ah ah ah”, count));`
  
  The first thing I need to do is get my cursor anywhere inside the parentheses
  belonging to map(). The exact command I use depends on where I end up:
  - If the cursor is just inside the open paren for map(), I could use “**cf)**”. This
  corrects all text up to and including the next “**)**” on this line.
  - Say the cursor is on the word “format”. I would do “**ci(**”. Vim will search
  backward to find the first open paren, then search forward to find its match,
  and correct the text between (but not including) those characters.
  - Maybe my cursor was already closest to the word “cookies.” To break out of the
  inner parentheses, I would need to add a count and do “**2ci(**”. This is almost
  identical to the last example, except that the 2 is needed due to the nested
  parentheses.

