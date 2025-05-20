Git
===


Config
------

### Default branch name

> $ git config --global init.defaultBranch main

Equivalent in `~./gitconfig`:

```
[init]
	defaultBranch = main
```


### Set default log format to iso8601

```bash
git config --global log.date iso
```

Equivalent in  `~/.gitconfig`:
```
[log]
	date = iso
```

Caveats regarding git's iso8601 formatting:
https://stackoverflow.com/questions/7853332/how-to-change-git-log-date-formats/26961614#26961614


Branches
--------


Show branches with their upstreams:

	git branch -vv



Remotes
-------

### List

	git remote --verbose

### View and change remote URLs:

	git remote get-url remoteName
	git remote set-url remoteName remoteUrl

### Rename a remote

	git remote rename <old-name> <new-name>


Remote on local filesystem
--------------------------
Create a remote on a local filesystem for push/pull.


Create a bare repository that will become the new remote:
```bash
$ git init --bare /path/to/remote/foobar.git
```

Add the new bare repository's path as a remote to the project, and give the remote a name:
```bash
project/foobar$ git remote add myRemote /path/to/remote/foobar.git
```

To push to that remote only:
```bash
git push myRemote
```



Modifying commits
-----------------

### Amend the last commit

	git amend -m "Updated commit message"

If the commit was already pushed, do a force push as well:

	git push --force


### Undo a commit & push

https://stackoverflow.com/questions/448919/how-can-i-remove-a-commit-on-github



Storing Binaries
----------------

https://www.devgem.io/posts/adding-and-managing-pdfs-in-git-repositories-a-practical-guide

In `.gitattributes`:
```
*.pdf binary
```
https://thelinuxcode.com/gitattribute-file-in-git/




Git patch and apply
-------------------

How to Create and Apply Git Patches - CraftQuest
https://www.youtube.com/watch?v=QtXj9tt-RUE

	git format-patch

https://git-scm.com/docs/git-format-patch
https://git-scm.com/docs/git-am				git apply mail





Convert a sequence of commits to a branch
-----------------------------------------
https://stackoverflow.com/questions/364925/is-it-possible-to-retroactively-turn-a-set-of-commits-into-a-branch


If you want all the commits *after* revision XXX to have happened in a branch:

	$ git branch new-branch-name      # create the new branch
	$ git reset --hard XXX            # reset current branch to commit XXX

Force push to remote:

	$ git push --force origin current-branch


Deleted Files
-------------

A quick one-liner to find commits where deletions have occurred:
```bash
git log --diff-filter=D --format=reference
```


Repository filtering - git-filter-repo
--------------------------------------

https://github.com/newren/git-filter-repo/

Manual:
https://htmlpreview.github.io/?https://github.com/newren/git-filter-repo/blob/docs/html/git-filter-repo.html


```bash
sudo apt install git-filter-repo
```


To only keep a specific directory (from a local copy):

```bash
git-filter-repo --force --path directoryName
```

To exclude a specific directory (from a local copy):

```bash
git-filter-repo --force --invert-paths --path directoryName
```


Pre-commit hooks
----------------
https://stackoverflow.com/collectives/articles/71270196/how-to-use-pre-commit-to-automatically-correct-commits-and-merge-requests-with-g

https://youtu.be/Md44rcw13k4?t=479



GitHub
------
https://trufflesecurity.com/blog/anyone-can-access-deleted-and-private-repo-data-github

> As long as one fork exists, any commit to that repository network (ie: commits on the “upstream” repo or “downstream” forks) will exist forever.



Linus on merge-commits:
	https://linux.slashdot.org/story/21/09/11/2316216/torvalds-merges-support-for-microsofts-ntfs-file-system-complains-github-creates-absolutely-useless-garbage-merges



Videos
------

So You Think You Know Git - FOSDEM 2024
https://www.youtube.com/watch?v=aolI_Rz0ZqY

	includeif: different paths for different git configs
	rerere: reuse merge conflict resolution
	force with lease - should be default
	git maintenance
	submodules suck

So You Think You Know Git Part 2 - DevWorld 2024
https://www.youtube.com/watch?v=Md44rcw13k4

	checkout is overloaded, hence switch & restore
	.gitattributes - preprocess files before diff, eg image exit
		smudge & clean
		this is how LFS works
	--fixup
	scalar clone for v.large repos
	worktrees for working on multiple branches simultaneously


UI Tools
--------

https://github.com/gitui-org/gitui

