Linux
=====


SysRq / Reisub
--------------

https://en.wikipedia.org/wiki/Magic_SysRq_key

 Alt + SysRq (Print Screen)

### REISUB
	r	Switch the keyboard from raw mode, used by programs such as X11 and SVGAlib, to XLATE mode
	e	Send the SIGTERM signal to all processes except init (PID 1)
	i	Send the SIGKILL signal to all processes except init
	s	Sync all mounted filesystems
	u	Remount all mounted filesystems in read-only mode
	b	Immediately reboot the system, without unmounting or syncing filesystems


Also
	o	Shut off the system

### NB on Ubuntu

	cat /proc/sys/kernel/sysrq
	176

https://askubuntu.com/questions/1442557/what-does-176-mean-in-linux-magic-sysrq-key

>	So, 176 means that
>	16 =  0x10 - enable sync command
>	32 =  0x20 - enable remount read-only
>	128 =  0x80 - allow reboot/poweroff

So only `s`,`u` and `b` actually do anything.


Random
------

https://en.wikipedia.org/wiki/Executable_and_Linkable_Format
https://en.wikipedia.org/wiki/Application_binary_interface


https://mywiki.wooledge.org/glob


Get shell options:

	shopt

Kernel parameters

	sysctl -a



Device major/minor numbers
--------------------------
https://www.oreilly.com/library/view/linux-device-drivers/0596000081/ch03s02.html

https://lxr.linux.no/#linux+v2.6.31/Documentation/devices.txt




CPU Vulnerability Mitigations
-----------------------------
grep . /sys/devices/system/cpu/vulnerabilities/*

/sys/devices/system/cpu/vulnerabilities

https://wiki.ubuntu.com/SecurityTeam/KnowledgeBase/SpectreAndMeltdown/MitigationControls


https://github.com/speed47/spectre-meltdown-checker
