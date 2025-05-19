Bash
====


Quotes
------

* Single quotes store string literals
* Double quotes allow for string interpolation
* Backticks are for command substitution



Loop through directories
------------------------

Immediate subdirectories

```bash
basedir=`pwd`
for directory in */
do
	cd "$basedir/$directory"
	echo "$basedir/$directory"
	# do something
done
cd "$basedir"
```


