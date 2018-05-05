---
title: Vim
desc: Cheat sheet for Vim.
---

#### Movement
  - **h j k l**          &rarr; basic movement keys ... **10j**
  - **b w B W**          &rarr; move back/forward by token/word
  - **e E**              &rarr; move to end of the token/word
  - **f**\<char\>        &rarr; move to the \<char\>
  - **0**                &rarr; jump to first character of line
  - **\_**               &rarr; jump to first non-whitespace character of line
  - **^**                &rarr; jump to first non-whitespace character of line
  - **g\_**              &rarr; jump to last non-whitespace character of line
  - **$**                &rarr; jump to end of the line
  - **ctrl+u ctrl+d**    &rarr; page up, page down
  - \<line-number\>**G** &rarr; jump to a specific line number
  - **H M L**            &rarr; move to the top/middle/bottom of the screen
  - **# &#42;**          &rarr; find the previous/next occurrence of the token under the cursor
  - **n N**              &rarr; repeat the last find command forward/backward
  - **''**               &rarr; jump back to where you just were
  - **ctrl+o ctrl+i**    &rarr; move backward/forward through the jump history
  - **{}**               &rarr; move to the beginning/end of the paragraph
  - **()**               &rarr; move to the beginning/end of the sentence
  - **%**                &rarr; jump to the corresponding (, {, [
  - **f**\<char\>        &rarr; move to next occurrence of the \<char\> on the line &rarr; **,** next **;** previous occurrence
  - **t**\<char\>        &rarr; move just before the \<char\>

#### Moving screen
  - **zz** &rarr; scroll the view, that cursor is at center
  - **zt** &rarr; (top) scroll the view, that cursor is at top
  - **zb** &rarr; (bottom) scroll the view, that cursor is at bottom

#### Marking location
  - **m**\<char\>  &rarr; create mark \<char\> to the current location **ma**
  - **\'**\<char\> &rarr; move to the line containing mark \<char\> **\'a**
  - **\`**\<char\> &rarr; move to the precise location of mark \<char\> **\`a**

#### Macros
  - **q**\<char\> command **q** &rarr; create macro \<char\> containing command
  - **qa0vwhr\_jq**             &rarr; create macro **a** which in visual mode replace everything from begining of line to the first word with underscore
  - **\@**\<char\>              &rarr; use macro \<char\>
  - **2\@**\<char\>             &rarr; use macro \<char\> two times
  - **\@\@**                    &rarr; use last macro
  - :reg                        &rarr; shows all registers / macros

#### Registers
  - **\"**\<char\> command &rarr; create register \<char\> containing output of command
  - **\"ay/foo**           &rarr; yanking a copy of the text from here to the next line containing "foo" into **a** register
  - **\"ap**               &rarr; pastes a copy of the **a** register's content into the text after cursor
  - **\"+yw**              &rarr; copy to system's clipboard
  - **\"+p**               &rarr; paste from system's clipboard

#### Search
  - **/**\<char\> &rarr; search for \<char\> forwords
  - **n**         &rarr; to go to next occurrence
  - **N**         &rarr; to go to previous occurrence
  - **ggn**       &rarr; to go to first occurrence
  - **Gn**        &rarr; to go to last occurence
  - **?**\<char\> &rarr; search for \<char\> backwords
  - **n**         &rarr; to go to previous occurrence
  - **N**         &rarr; to go to next soccurrence

#### Editing
  - **i a I A**     &rarr; insert/append at/after cursor/beginning/end of line
  - **o O**         &rarr; open new line below/above the current line
  - **o**\<esc\>    &rarr; add a blank line
  - **cw cW**       &rarr; correct token/world following the cursor
  - **cc**          &rarr; correct line by clearing and then entering insert mode
  - **C**           &rarr; correct till end of the line
  - **dd**          &rarr; delete line
  - **D**           &rarr; delete till end of the line - same as **d$**
  - **ct cf ci ca** &rarr; correct up to or including specific characters
  - **dt df di da** &rarr; delete up to or including specific characters
  - **s**           &rarr; delete character at the cursor ant then enter insert mode **5s**
  - **yy**          &rarr; copy line
  - **yw yW**       &rarr; copy token/word
  - **p P**         &rarr; paste before/after cursor
  - **u ctrl+r**    &rarr; undo and redo
  - **.**           &rarr; repeat the previous edit command
  - **r**           &rarr; replace one character
  - **R**           &rarr; replace till the escape key is hit

#### Indent
  - **\>\>**        &rarr; indent a line to the right
  - **\<\<**        &rarr; indent a line to the left
  - **5\<\<**       &rarr; indent 5 lines to the left
  - **\>}**         &rarr; indent one paragraph to the right
  - **=i}**         &rarr; auto indent everything inside a paragraph
  - **\>aB**        &rarr; indent a Block
  - **==**          &rarr; auto indent a line
  - **gg=G**        &rarr; select whole file and autoindent
  - **ggvG=**       &rarr; select whole file and autoindent in visual mode

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

  - If the cursor is just inside the open paren for map(), I could use “**cf)**”. This corrects all text up to and including the next “**)**” on this line.

  - Say the cursor is on the word “format”. I would do “**ci(**”. Vim will search backward to find the first open paren, then search forward to find its match, and correct the text between (but not including) those characters.

  - Maybe my cursor was already closest to the word “cookies.” To break out of the inner parentheses, I would need to add a count and do “**2ci(**”. This is almost identical to the last example, except that the 2 is needed due to the nested parentheses.

  Some usefull commands:  
  - **dw** &rarr; delete to the end of a word  
  - **diw** &rarr; delete the entire word at the cursor  
  - **y4j** &rarr; copy 4 lines  
  - **cit** &rarr; change the content inside an HTML tag  

#### Tabs
  - **gt**  &rarr; go to next tab
  - **gT**  &rarr; go to previous tab
  - **2gt** &rarr; go to second tab

#### Explore file system
  - **:e.**  &rarr; open file explorer at current working directory
  - **:sp.** &rarr; open file explorer in split at current working directory
  - **:vs.** &rarr; open file explorer in vertical split at current working directory
  - **:Se**  &rarr; open file explorer in split at directory of current file

#### Visual mode
  - **Ctrl + v**     &rarr; visual block
  - **v**            &rarr; visual
  - **vW**           &rarr; select word
  - **vjjjJ**        &rarr; select three lines and join them to one

#### Search and replace
  - **:%s/foo/bar/g**       &rarr; change each 'foo' to 'bar' in **all lines**
  - **:s/foo/bar/g**        &rarr; change each 'foo' to 'bar' in the **current line only**)
  - **:%s/foo/bar/gc**      &rarr; change each 'foo' to 'bar', but **ask for confirmation** first
  - **:%s/\<foo\>/bar/gc**  &rarr; change only whole words **exactly matching** 'foo' to 'bar'
  - **:%s/foo/bar/gci**     &rarr; change each 'foo' to 'bar' **case insensitive**
  - **:%s/foo/bar/gcI**     &rarr; change each 'foo' to 'bar' **case sensitive**
  - **:%s/foo//gn**         &rarr; show count number of matches of 'foo'
  - **:%s///gn**            &rarr; show count number of matches of last searched pattern (if \* used on some word)
