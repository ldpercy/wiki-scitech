#!/bin/bash

# backup-machine-config
#
# Backs up local machine config to the specified directory
# Only includes things that require sudo/root access
#
#	sudo ./backup-machine-config.sh destination
#

destination="$1/$HOSTNAME"

echo "Backup destination: $destination"

if [ ! -d "$destination" ]; then
	mkdir "$destination"
fi

# system infomation
hostnamectl > "$destination/hostnamectl.txt"

# kernel information
sysctl -a > "$destination/sysctl.txt"


# Disk & partition information
fdisk --list-details	> "$destination/fdisk-list-details.txt"
sfdisk --list			> "$destination/sfdisk-list.txt"
lsblk --output-all --json --sort=name > "$destination/lsblk-all.json"
cp /etc/fstab* "$destination"


# Other config
cp /etc/sysctl.conf "$destination"
cp /etc/default/grub "$destination"
