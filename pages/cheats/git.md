---
title: Git
desc: Cheat sheet for git.
---

## Create
 - **git init** \<project\> &rarr; create a new directory \<project\> with git repository
 - **git clone ssh://user@domain.com/repo.git** &rarr; clone an existing repository

## Local changes
 - **git status** &rarr; changed files in your working directory
 - **git status -s** &rarr; changed files in your working directory, short view
 - **git diff** &rarr; changes to tracked files
 - **git diff \-\-staged** &rarr; changes to staged files
 - **git add .** &rarr; add all current changes from current directory down
 - **git add ..** &rarr; add all current changes from one directory up to down
 - **git add \-\-all** &rarr; add all current changes in whole repository
 - **git add -p** \<file\> &rarr; add some changes in \<file\> to the next
 - **git rm** \<file\> &rarr; remove \<file\> also from hard drive
 - **git rm \-\-cached** \<file\> &rarr; remove \<file\> only from repository (stays on hard drive)
 - **git mv README README.md** &rarr; git rm README, git add README.md commit
 - **git commit -a** &rarr; commit all local changes in tracked files
 - **git commit** &rarr; commit previously staged changes
 - **git commit \-\-amend** &rarr; change the last commit

## Commit history
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
 - **git log \-\-grep 'commit name'** &rarr; filter commits with the commit name
 - **git log origin/master..HEAD** &rarr; show commits which weren't pushed yet
 - **git log -Sfunction_name** &rarr; show all commits with this function in it
 - **git blame** \<file\> &rarr; who changed what and when in \<file\>

## Branches and tags
 - **git branch -av** &rarr; list all existing branches
 - **git branch** \<new-branch\> &rarr; create a new branch based on your current HEAD
 - **git branch -d** \<branch\> &rarr; delete a local branch
 - **git checkout** \<branch\> &rarr; switch HEAD branch
 - **git checkout \-\-track** \<remote/branch\> &rarr; create a new tracking branch based on a remote branch
 - **git tag** &rarr; lists all tags
 - **git tag** \<tag-name\> &rarr; make a current commit with a tag
 - **git tag -a v1.0 -m 'my version 1.0'** &rarr; create anotated tag
 - **git tag v1.4_lw** &rarr; create lightweight tag
 - **git tag -a v0.6 9cf84** &rarr; put tag to particullar commit
 - **git show v 1.0**
 - **git push origin** \<tagname\> &rarr; push particullar tag
 - **git push origin \-\-tags** &rarr; push all the tags

## Update and publish
 - **git remote** &rarr; lists the shortname of each remote
 - **git remote -v** &rarr; list all currently configured remotes
 - **git remote add** \<shortname\> \<url\> &rarr; add new remote repository
 - **git remote show** \<remote\> &rarr; show info about a remote
 - **git remote rename pb paul** &rarr; rename remote from pb to paul
 - **git remote rm paul** &rarr; remove remote paul
 - **git fetch** \<remote\> &rarr; get all changes from remote (BUT NOT MERGE)
 - **git pull** &rarr; get all changes from remote and MERGE
 - **git push** \<remote\> \<branch\> &rarr; publish local changes on a remote
 - **git branch -dr** \<remote/branch\> &rarr; delete a branch on the remote

## Merge and rebase
 - **git merge** \<branch\> &rarr; merge \<branch\> into your current HEAD
 - **git rebase** \<branch\> &rarr; rebase your current HEAD onto \<branch\>
 - **git rebase \-\-abort** &rarr; abort rebase
 - **git rebase \-\-continue** &rarr; continue a rebase after resolving conflicts
 - **git mergetool** &rarr; use your configured merge tool to solve conflicts

## Undo
 - **git checkout HEAD** \<file\> &rarr; discard local changes in a specific file
 - **git revert** \<commit\> &rarr; revert a commit (by producing a new commit with contrary changes)
 - **git reset \-\-hard HEAD** &rarr; discard all local changes in you working directory
 - **git reset \-\-hard** \<commit\> &rarr; reset your HEAD pointer to a previous commit ...and discard all changes since then
 - **git reset** \<commit\> &rarr; ...and preserve all changes as unstaged changes
 - **git reset \-\-keep** \<commit\> &rarr; ...and preserve uncommitted local changes

## Config
 - **git config \-\-global user.name "bendo"**
 - **git config \-\-global user.email bendo@gmail.com**  
   **global** &rarr; write into config and ~  
   **system** &rarr; write into etc  
   **without anything** &rarr; write only to project
 - **git config \-\-list** &rarr; shows settings
 - **git config user.name** &rarr; shows user name from settings
