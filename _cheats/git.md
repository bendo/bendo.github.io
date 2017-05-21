---
layout: page
title: Git
desc: Cheat sheet for git.
---

#### Create
 - **git init** &rarr; create a new local repository
 - **git clone ssh://user@domain.com/repo.git** &rarr; clone an existing
   repository

#### Local changes
 - **git status** &rarr; changed files in your working directory
 - **git status -s** &rarr; changed files in your working directory, short view
 - **git diff** &rarr; changes to tracked files
 - **git diff --staged** &rarr; changes to staged files
 - **git add .** &rarr; add all current changes from current directory down
 - **git add ..** &rarr; add all current changes from one directory up to down
 - **git add \-\-all** &rarr; add all current changes in whole repository
 - **git add -p** \<file\> &rarr; add some changes in \<file\> to the next
 - **git rm** \<file\> &rarr; remove \<file\> also from hard drive
 - **git rm \-\-cached** \<file\> &rarr; remove \<file\> only from repository
   (stays on hard drive)
 - **git mv README README.md** &rarr; git rm README, git add README.md
   commit
 - **git commit -a** &rarr; commit all local changes in tracked files
 - **git commit** &rarr; commit previously staged changes
 - **git commit \-\-amend** &rarr; change the last commit

#### Commit history
 - **git log** &rarr; show all commits, starting with newest
 - **git log -p** \<file\> &rarr; show changes over time for specific \<file\>
 - **git log -2** &rarr; show last two commits
 - **git log \-\-stat** &rarr; show summarizing info per commit
 - **git log \-\-pretty=oneline** / **short** / **full** / **fuller**
 - **git log \-\-pretty=format:"%h_%an, %ar : %s"**
 - **git log \-\-pretty="%h - %s"** &rarr; h = hash \| s = subject
 - **git log \-\-graph** &rarr; shows commits with graph
 - **git log \-\-since=2.weeks** &rarr; show all commits since two weeks
 - **git log \-\-until=3.weeks** &rarr; show all commits until three weeks
 - **git log \-\-author=**\<user\> &rarr; show all commits from \<user\>
 - **git log \-\-grep 'commit name'** &rarr; filter commits with the commit
   name
 - **git log -Sfunction_name** &rarr; show all commits with this function in it
 - **git blame** \<file\> &rarr; who changed what and when in \<file\>

#### Branches and tags
 - **git branch -av** &rarr; list all existing branches
 - **git checkout** \<branch\> &rarr; switch HEAD branch
 - **git tag** &rarr; lists all tags
 - **git tag** \<tag-name\> &rarr; make a current commit with a tag
 - **git tag -l 'v1.8.5*'**
 - **git tag -a v1.0 -m 'my version 1.0'** &rarr; create anotated tag
 - **git show v 1.0**
 - **git tag v1.4_lw** &rarr; create lightweight tag
 - **git tag -a v0.6 9cf84** &rarr; put tag to particullar commit
 - **git push origin** \<tagname\> &rarr; push particullar tag
 - **git push origin --tags** &rarr; push all the tags

#### Update and publish
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


 - **git reset HEAD file** &rarr; unstage
 - **git checkout -- file** &rarr; revert changes on the file

 - **git config --global user.name "bendo"**
 - **git config --global user.email bendo@gmail.com**  
   **global** &rarr; do configu a ~  
   **system** &rarr; do etc  
   **bez nicoho** &rarr; len do projektu  
 - **git config --list** &rarr; vypise nastavenia
 - **git config user.name** &rarr; vypise nastavene meno
