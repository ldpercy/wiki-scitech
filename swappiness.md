Swappiness
==========

Read current swappiness value:

	cat /proc/sys/vm/swappiness

Set temporary swappiness value:

	sudo sysctl vm.swappiness=45


Set permanent swappiness value - add this line to /etc/sysctl.conf:

	vm.swappiness=15


Refs
----

https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/

https://askubuntu.com/questions/103915/how-do-i-configure-swappiness