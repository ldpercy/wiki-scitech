#!/bin/bash

# backup-config
#
# backs up some local machine config to a specified directory
#
# ./backup-config.sh destination
# sudo ./backup-config.sh destination
#
# sudo captures more items out of etc/

destination=$1

echo "Backup destination: $destination"

# System config:
cp --recursive /etc "$destination"

# Install lists:
apt list --installed	> "$destination/apt-list-installed.txt"
snap list 				> "$destination/snap-list.txt"
flatpak list			> "$destination/flatpak-list.txt"


# create home dirs if needed
if [ ! -d "$destination/home/" ]; then
	mkdir "$destination/home/"
fi
if [ ! -d "$destination/home/.config/" ]; then
	mkdir "$destination/home/.config/"
fi
if [ ! -d "$destination/home/.ssh/" ]; then
	mkdir "$destination/home/.ssh/"
fi


# User config:
cp --recursive ~/.config/				"$destination/home/.config"
cp --recursive ~/.ssh/					"$destination/home/.ssh"
cp ~/.profile							"$destination/home/"
cp ~/.bashrc							"$destination/home/"
cp ~/.gitconfig							"$destination/home/"


# Remove unneeded items from user config
rm --recursive "$destination/home/.config/VSCodium/Cache/"
rm --recursive "$destination/home/.config/VSCodium/CachedData/"
rm --recursive "$destination/home/.config/VSCodium/logs/"
rm --recursive "$destination/home/.config/VSCodium/User/History"
