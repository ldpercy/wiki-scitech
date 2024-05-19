Git
===



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

