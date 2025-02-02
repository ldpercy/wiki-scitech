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
