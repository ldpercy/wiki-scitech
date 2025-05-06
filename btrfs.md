BTRFS
=====

https://en.wikipedia.org/wiki/Btrfs

https://www.kernel.org/doc/html/latest/filesystems/btrfs.html

https://btrfs.readthedocs.io/

https://wiki.archlinux.org/index.php/Btrfs

https://help.ubuntu.com/community/btrfs

https://www.reddit.com/r/btrfs/

https://facebookmicrosites.github.io/btrfs/docs/btrfs-facebook.html



Tools
-----

### Timeshift

https://github.com/linuxmint/timeshift

While the timeshift GUI is running snapshots are visible in:

	/run/timeshift/12345/backup/timeshift-btrfs/

Where '12345' is an arbitrary number that changes with each launch of the program.
It also makes other system snapshots visible in `/run/timeshift/12345/backup/`.
The directory disappears when the app is closed.

### btrbk

https://github.com/digint/btrbk
https://digint.ch/btrbk/


### btrfs-assistant

https://gitlab.com/btrfs-assistant/btrfs-assistant

### btrfs-heatmap

https://github.com/knorrie/btrfs-heatmap


### BTRFS Subvolume Manager Service Menu for Dolphin

https://store.kde.org/p/1214134


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
	4001    70001   1003            <FS_TREE>/snapshot-dir/my-subvol1.snapshot
	4002    70002   1003            <FS_TREE>/snapshot-dir/my-subvol2.snapshot
```

### Subvolume information

The base btrfs partition is the 'root' subvolume.

Example output from `sudo btrfs subvolume show -h /my-btrfs-partition`:
```
/
	Name:               <FS_TREE>
	UUID:               [...]
	Parent UUID:        -
	Received UUID:      -
	Creation time:      [...]
	Subvolume ID:       5
	Generation:         12345
	Gen at creation:    0
	Parent ID:          0
	Top level ID:       0
	Flags:              -
	Send transid:       0
	Send time:          [...]
	Receive transid:    0
	Receive time:       -
	Snapshot(s):
	                    my-subvol1
	                    my-subvol2
	                    snapshot-dir
	Quota group:        n/a
```
Child subvolumes have the root subvolume as their parent - `sudo btrfs subvolume show -h my-subvolume1`:
```
my-subvol1
	Name:               my-subvol1
	UUID:               [...]
	Parent UUID:        [...]
	Received UUID:      -
	Creation time:      [...]
	Subvolume ID:       1001
	Generation:         50001
	Gen at creation:    40001
	Parent ID:          5
	Top level ID:       5
	Flags:              -
	Send transid:       0
	Send time:          [...]
	Receive transid:    0
	Receive time:       -
	Snapshot(s):
	                    my-subvol1.snapshot
	Quota group:        n/a
```


Common setup for BTRFS as root
------------------------------

Many distros follow this pattern.

The installer creates two subvolumes `@` and `@home` on the main btrfs partition:

	ID      gen     top level       path
	--      ---     ---------       ----
	123     54321   5               @
	456     87654   5               @home

These subvolumes are mounted at `/` and `/home` in `etc/fstab`:

	UUID=11111111-2222-3333-4444-555555555555    /        btrfs   subvol=@        0    1
	UUID=66666666-7777-8888-9999-000000000000    /home    btrfs   subvol=@home    0    2

In day-to-day use you never really 'see' the subvolumes, they're entirely transparent.

Timeshift will snapshot the `@` subvolume according to your schedule with names like:

	timeshift-btrfs/snapshots/2025-01-01_01-01-01/@

Apt will automatically take snapshots during distribution-upgrades as:

	@apt-snapshot-release-upgrade-foobar-2025-01-01_01:01:01

NB while the Timeshift GUI is running these snapshots are visible under `/run/timeshift/`.


Snapshots
---------

Tools such as Timeshift and btrbk make this easier.

Via commandline:

	sudo btrfs subvolume snapshot /btrfs-partition/subvolume-name  /btrfs-partition/subvolume-name.snapshot


Manual Rollback of `@`
----------------------

In emergencies you can rollback to an earlier `@` (root) snapshot with this technique, though many caveats apply.
Do this from a different machine or live media.

First rename the problematic `@` subvolume to something else:

	sudo mv /different-host/guest-btrfs-partition/@  /different-host/guest-btrfs-partition/@-broken

Then create a brand new snapshot of a known good point in the past, this time calling it `@`:

	sudo btrfs subvolume snapshot /different-host/guest-btrfs-partition/@-good-snapshot  /different-host/guest-btrfs-partition/@

With luck this will take you back your previous state.
