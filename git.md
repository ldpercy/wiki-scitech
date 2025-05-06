Git
===


Set default log format to iso8601
---------------------------------

```bash
git config --global log.date iso
```

Or add this to your `~/.gitconfig`
```
[log]
	date = iso
```

See caveats regarding git's iso8601 formatting here:
https://stackoverflow.com/questions/7853332/how-to-change-git-log-date-formats/26961614#26961614



Convert a sequence of commits to branch
---------------------------------------
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
