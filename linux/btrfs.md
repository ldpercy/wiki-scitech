BTRFS
=====

Mount Options
-------------

https://btrfs.readthedocs.io/en/latest/ch-mount-options.html
https://wiki.tnonline.net/w/Btrfs/Mount_Options

### autodefrag

Default off, may be helpful on hard disks.
Mentioned as helpful for things like firefox's database:
https://archive.kernel.org/oldwiki/btrfs.wiki.kernel.org/index.php/Gotchas.html#Fragmentation

### compress

https://btrfs.readthedocs.io/en/latest/Compression.html
Default: off
Has to be specified if wanted, eg:

	compress=lzo

### space_cache

Default: space_cache=v2

space_cache=v2 good for large (tb range) disks


### default mount options for auto-mounted disks

Create `/etc/udisks2/mount_options.conf` that defines the default mount options for externally mounted drives that are "auto mounted" using udisks2

Example:
```conf
[defaults]
btrfs_defaults=noatime,autodefrag,space_cache=v2,compress=lzo
btrfs_allow=noatime,space_cache,compress,compress-force,datacow,nodatacow,datasum,nodatasum,degraded,device,discard,nodiscard,subvol,subvolid
```


Tools
-----

### Timeshift

https://github.com/linuxmint/timeshift

While the timeshift gui is running system snapshots are visible the directory:

	/run/timeshift/12345/backup/timeshift-btrfs/

Where '12345' is an arbitrary number that changes with each launch of the program.
It also makes other system snapshots visible in `/run/timeshift/12345/backup/`.

Upon shutdown the directory disappears.

### btrbk

Command line based subvolume-backup utility.

https://github.com/digint/btrbk
https://digint.ch/btrbk/



### btrfs-assistant

https://gitlab.com/btrfs-assistant/btrfs-assistant

Not in Ubuntu 24.04 LTS/Neon yet.
Available on fedora, though reports of problems.


### BTRFS Subvolume Manager Service Menu for Dolphin

https://store.kde.org/p/1214134
requires notify-send
which is in libnotify-bin

	To install, place the "subvol_manager.desktop" file and the "subvol_manager-scripts" folder and it's contents into:
	Plasma 6:
	~/.local/share/kio/servicemenus


### btrfs-heatmap

https://github.com/knorrie/btrfs-heatmap


### btrfs maintenance

https://github.com/kdave/btrfsmaintenance


Subvolumes
----------

### Subvolume list
```bash
sudo btrfs subvolume list -a -t /my-btrfs-partition

	ID      gen     top level       path
	--      ---     ---------       ----
	1001    50001   5               my-subvol1
	1002    50002   5               my-subvol2
	1003    50003   5               snapshot-dir
	4001    70001   1527            <FS_TREE>/snapshot-dir/my-subvol1.snapshot
	4002    70002   1527            <FS_TREE>/snapshot-dir/my-subvol1.snapshot

```

### Subvolume information

The base btrfs partition is the 'root' subvolume.

Example output from `sudo btrfs subvolume show -h /my-btrfs-partition`:
```
	/
		Name:				<FS_TREE>
		UUID:				[...]
		Parent UUID:		-
		Received UUID:		-
		Creation time:		[...]
		Subvolume ID:		5
		Generation:			12345
		Gen at creation:	0
		Parent ID:			0
		Top level ID:		0
		Flags:			-
		Send transid:		0
		Send time:			[...]
		Receive transid:	0
		Receive time:		-
		Snapshot(s):
							my-subvolume1
							my-subvolume2
							snapshot-dir
		Quota group:		n/a
```
Child subvolumes have the root subvolume as their parent - `sudo btrfs subvolume show -h my-subvolume1`:
```
	my-subvolume
		Name: 				my-subvolume1
		UUID: 				[...]
		Parent UUID: 		[...]
		Received UUID: 		-
		Creation time: 		[...]
		Subvolume ID: 		1001
		Generation: 		50001
		Gen at creation: 	40001
		Parent ID: 			5
		Top level ID: 		5
		Flags: 				-
		Send transid: 		0
		Send time: 			[...]
		Receive transid: 	0
		Receive time: 		-
		Snapshot(s):
							my-subvolume1.snapshot
		Quota group:		n/a
```


Common setup for BTRFS as root
------------------------------

Many distros follow this pattern.

The installer creates two (or more) subvolumes on the main btrfs partition:

	ID      gen     top level       path
	--      ---     ---------       ----
	123     54321   5               @
	456     87654   5               @home

Which get mounted in their usual places in `etc/fstab`:

	UUID=11111111-2222-3333-4444-555555555555    /        btrfs   subvol=@        0    1
	UUID=66666666-7777-8888-9999-000000000000    /home    btrfs   subvol=@home    0    2

In day-to-day use you never really 'see' these subvolumes, they're entirely transparent.

Timeshift will snapshot the `@` subvolume according to your settings with names like:

	timeshift-btrfs/snapshots/2025-01-01_01-01-01/@

Apt will automatically take snapshots during distribution-upgrades as:

	@apt-snapshot-release-upgrade-foobar-2025-01-01_01:01:01

NB while the timeshift GUI is running these snapshots are visible under `/run/timeshift/`.


Snapshots
---------

Tools such as Timeshift and btrbk make this easier.

Via commandline:

	sudo btrfs subvolume snapshot /btrfs-partition/subvolume-name  /btrfs-partition/subvolume-name.snapshot


### Change read-only status

	sudo btrfs property set /btrfs-partition/subvolume-name ro false


Exclusive and shared size
-------------------------

Useful for showing differences between snapshots and sources:

	btrfs filesystem du  --summarize [path]


Manual Rollback of `@`
----------------------

In emergencies you can rollback to an earlier `@` (root) snapshot with this technique, though many caveats apply.
Do this from a different machine or live media.

First rename the problematic `@` subvolume to something else:

	sudo mv /different-host/guest-btrfs-partition/@  /different-host/guest-btrfs-partition/@-broken

Then create a brand new snapshot of a known good point in the past, this time calling it `@`:

	sudo btrfs subvolume snapshot /different-host/guest-btrfs-partition/@-good-snapshot  /different-host/guest-btrfs-partition/@

With luck this will revert to the previous state.



References
----------

https://btrfs.wiki.kernel.org/index.php/Main_Page#External_Btrfs_Documentation_.2F_Guides

https://btrfs.wiki.kernel.org/index.php/Manpage/btrfs(5)#MOUNT_OPTIONS
https://btrfs.wiki.kernel.org/index.php/Manpage/btrfs-subvolume


https://btrfs.wiki.kernel.org/index.php/FAQ#Can_I_have_nodatacow_.28or_chattr_.2BC.29_but_still_have_checksumming.3F

https://btrfs.wiki.kernel.org/index.php/UseCases#Snapshots_and_subvolumes

https://btrfs.wiki.kernel.org/index.php/Incremental_Backup

https://btrfs.wiki.kernel.org/index.php/SysadminGuide#When_To_Make_Subvolumes
https://btrfs.wiki.kernel.org/index.php/Project_ideas#Cleanup_projects


https://wiki.archlinux.org/index.php/Btrfs
https://help.ubuntu.com/community/btrfs
https://www.reddit.com/r/btrfs/

https://facebookmicrosites.github.io/btrfs/docs/btrfs-facebook.html



Luigi Tech - BACKUP: RSYNC vs BTRFS SEND/RECEIVE on Linux
	https://www.youtube.com/watch?v=0JreEvSQK-0


