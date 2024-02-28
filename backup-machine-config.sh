#!/bin/bash

# backup-machine-config
#
# Backs up local machine config to the specified directory
# Only inlcudes things that require sudo/root access
#
#	sudo ./backup-machine-config.sh destination
#

destination="$1/$HOSTNAME"

echo "Backup destination: $destination"

if [ ! -d "$destination" ]; then
	mkdir "$destination"
fi

# Disk & partition information
fdisk --list-details	> "$destination/fdisk-list-details.txt"
sfdisk --list			> "$destination/sfdisk-list.txt"

# System config:
cp --recursive /etc "$destination"
