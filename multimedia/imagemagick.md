
ImageMagick
===========

https://en.wikipedia.org/wiki/ImageMagick



Convert all PNGs in a directory to JPG:

	mogrify -format jpg -quality 90 *.png



For immediate subdirectories:

```bash
basedir=`pwd`
for directory in */
do
	cd "$basedir/$directory"
	echo "$basedir/$directory"
	mogrify -format jpg -quality 90 *.png
done
cd "$basedir"
```

