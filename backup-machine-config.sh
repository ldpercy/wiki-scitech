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


# etc config:
# cp --recursive /etc "$destination"

# Give the current user ownership of all files. I'm unsure of the security implications of this for certain items in /etc
# chown -R $SUDO_USER:$SUDO_USER "$destination"

# So doing this is probably a really bad idea unless it's purely academic or you have *total* security of the backup...
# Going to find a better solution
