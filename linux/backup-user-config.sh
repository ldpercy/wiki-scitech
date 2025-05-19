#!/bin/bash

# backup-user-config
#
# Backs up user config to the specified directory
# Only includes things that can be run without sudo/root
#
#	./backup-user-config.sh destination
#



destination="$1/$USER"

echo "Backup destination: $destination"

# create dirs if needed
if [ ! -d "$destination" ]; then
	mkdir "$destination"
fi
if [ ! -d "$destination/.config/" ]; then
	mkdir "$destination/.config/"
fi
if [ ! -d "$destination/.ssh/" ]; then
	mkdir "$destination/.ssh/"
fi


# Install lists:
apt list --installed        > "$destination/apt-list-installed.txt"
snap list                   > "$destination/snap-list.txt"
flatpak list                > "$destination/flatpak-list.txt"


# User config:

shopt -s extglob

cp --recursive ~/.config/               "$destination"
cp --recursive ~/.ssh/*(config|*.pub)   "$destination/.ssh"
cp ~/.profile                           "$destination"
cp ~/.bashrc                            "$destination"
cp ~/.gitconfig                         "$destination"


# VSCodium - delete and copy in the config file
rm --recursive "$destination/.config/VSCodium/"
mkdir --parents "$destination/.config/VSCodium/User/"
cp  ~/.config/VSCodium/User/settings.json "$destination/.config/VSCodium/User/"

# Deletions
#
# * .tdb
