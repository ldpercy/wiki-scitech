Locale
======

The default locale settings are in `/etc/default/locale` - example:

```
LANG=en_AU.UTF-8
LC_ADDRESS=en_AU.UTF-8
LC_IDENTIFICATION=en_AU.UTF-8
LC_MEASUREMENT=en_AU.UTF-8
LC_MONETARY=en_AU.UTF-8
LC_NAME=en_AU.UTF-8
LC_NUMERIC=en_AU.UTF-8
LC_PAPER=en_AU.UTF-8
LC_TELEPHONE=en_AU.UTF-8
LC_TIME=en_AU.UTF-8
```

Modify:

	sudo localectl set-locale LC_TIME=en_CA.utf8


Generate locales:

	sudo locale-gen en_CA.UTF-8


KDE
---
KDE stores user locale settings in `~/.config/plasma-localerc` - example:
```
[Formats]
LANG=en_AU.UTF-8
LC_TIME=en_CA.UTF-8
```


