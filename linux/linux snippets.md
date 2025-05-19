Linux Snippets
==============


Systemd
-------

service --status-all



https://www.linode.com/docs/guides/introduction-to-systemctl/



loginctl unlock-session 4


sudo
----

Add user to sudo:

	sudo usermod -aG sudo alice

Requires reboot (logout/login not enough)


ISO write with dd
-----------------

	sudo dd status=progress if=imageFile.iso of=/dev/sdg



Bluetooth
---------

https://api.kde.org/frameworks/bluez-qt/html/index.html

sudo systemctl start bluetooth
sudo systemctl restart bluetooth
sudo systemctl reload-or-restart bluetooth

rfkill
