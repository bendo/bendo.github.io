---
layout: page
title: Git
desc: Cheat sheet for git.
---

 - **git config --global user.name "bendo"**
 - **git config --global user.email bendo@gmail.com**  
   **global** &rarr; do configu a ~  
   **system** &rarr; do etc  
   **bez nicoho** &rarr; len do projektu  
 - **git config --list** &rarr; vypise nastavenia
 - **git config user.name** &rarr; vypise nastavene meno

---

 - **git init**
 - **git clone**
 - **git clone http://github.com/lala**
 - **git clone http://github.com/lala betterDirName**

---

 - **git status**
 - **git status -s** / **git status --short**
 - **git diff** &rarr; zmeny, kt. este neboli stagnute
 - **git diff --staged** &rarr; zmeny (stagnute), kt. idu do commitu
 - **git commit -m 'really nice comment'**
 - **git commit -a -m 'skipping the staging area'**
 - **git rm filename** (zmaze aj z disku)
 - **git rm --cached filename** (zostane na disku)
 - **git mv README README.md** &rarr; git rm README, git add README.md

---

 - **git remote** &rarr; lists the shortname of each remote
 - **git remote -v** &rarr; shows urls
 - **git remote add [shortname] [url]** &rarr; add remote
 - **git fetch [remote name]** &rarr; get data from remote (NOT MERGE)
 - **git fetch origin**
 - **git pull** &rarr; get data from remote and MERGE
 - **git push [remote name] [branch name]** &rarr; push to server
 - **git push origin master**
 - **git remote show [remote name]** &rarr; more info about remote
 - **git remote rename pb paul** &rarr; rename from pb to paul
 - **git remote rm paul** &rarr; remove branch

---

 - **git tag** &rarr; lists all tags
 - **git tag -l 'v1.8.5*'**
 - **git tag -a v1.0 -m 'my version 1.0'** &rarr; create anotated tag
 - **git show v 1.0**
 - **git tag v1.4_lw** &rarr; create lightweight tag

---

 - **git log --pretty=oneline**
 - **git tag -a v0.6 9cf84** &rarr; put tag to particullar commit
 - **git push origin [tagname]** &rarr; push particullar tag
 - **git push origin --tags** &rarr; push all the tags
 - **git checkout -b version2 v2.0.0** &rarr; switch to a new branch 'version2'

---

 - **git log**
 - **git log -p -2** &rarr; -p = ukaze zmeny \| -2 = posledne 2 commity
 - **git log --stat** &rarr; summarizing info
 - **git log --pretty=oneline** / **short** / **full** / **fuller**
 - **git log --pretty=format:"%h_%an, %ar : %s"**
 - **git log --graph**
 - **git log --since=2.weeks**
 - **git log --until=3.weeks**
 - **git log --author=bendo**
 - **git log --grep 'commit name'**
 - **git log -Sfunction_name** &rarr; najde commit kde sa vyskituje nazov metody
 - **git log --pretty="%h - %s"** &rarr; h = hash \| s = subject

---

 - **git commit -m 'initial commit'**
 - **git add forgoten_files**
 - **git commit --amend** &rarr; prepise povodny commit

---

 - **git reset HEAD file** &rarr; unstage

---

 - **git checkout -- file** &rarr; revert changes on the file
