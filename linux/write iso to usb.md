Write ISO to USB
================

Please triple check the destination `of` with a disk/partition manager before doing this so you don't accidentally overwrite one of your drives.

```bash
sudo dd status=progress if=/path/to/disk/image.iso of=/dev/sdX
```

I may be safer to use one of these rather than sdX:

	/dev/disk/by-id/...
	/dev/disk/by-label/...

