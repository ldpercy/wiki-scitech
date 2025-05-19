KDE
===


https://store.kde.org/browse/


Features
--------

KDE Plasma Virtual Desktops and Activities (what's the difference?) Joe Longo
https://www.youtube.com/watch?v=fWKbZlPI12Y

	ctrl+f1, ctrl+f2 etc to switch desktops

Grouped like this:

	activity 1
		a1 desktop 1
		a1 desktop 2
	activity 2
		a2 desktop 1
		a2 desktop 2


Software & Applications
-----------------------

https://news.softpedia.com/news/kde-announces-systemdgenie-a-graphical-tool-for-managing-systemd-and-user-units-511119.shtml

https://userbase.kde.org/Plasma_application_launchers


### Muon

Is being removed from repositories, have to use Synaptic (gtk) instead.


### Note taking

https://apps.kde.org/en-gb/marknote/



Upgrading Kubuntu
-----------------

	pkexec do-release-upgrade -m desktop -f DistUpgradeViewKDE



Issues
------

Reset displays after turning one off:
	https://superuser.com/questions/1428997/reset-display-defaults-in-kde
	Press super (win) + p and release both



Date format to iso8601
----------------------
Dolphin follows the user's locale settings (which are based upon the system [default locale](locale.md) set during install).

Most locales don't use iso8601 for their date format so need to specify a time locale that does, such as en_CA (Canadian English).

	Settings -> Langauge & Time -> Region & Language -> Time

This gets stored in `~/.config/plasma-localerc` - example:
```
[Formats]
LANG=en_AU.UTF-8
LC_TIME=en_CA.UTF-8
```


