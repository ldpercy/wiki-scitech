Disk encryption
===============


https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system


https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#Encrypted_boot_partition_(GRUB)
https://wiki.archlinux.org/title/Dm-crypt/Specialties



LVM on LUKS
-----------

https://wiki.archlinux.org/title/Dm-crypt/Encrypting_an_entire_system#LVM_on_LUKS

Looks something like this:
```
	disk
		part1
			efi
		part2
			luks
				lvm vol group
					lv-part1
						root
					lv-part2
						home
					lv-part3
						swap
```

https://www.linux.com/training-tutorials/how-full-encrypt-your-linux-system-lvm-luks/



secure boot vs trusted boot
---------------------------
https://learn.microsoft.com/en-us/windows/security/operating-system-security/system-security/trusted-boot
https://www.urtech.ca/2021/11/solved-secure-boot-vs-trusted-boot-vs-measured-boot-whats-the-difference/



Cautions
--------

Trim
https://asalor.blogspot.com/2011/08/trim-dm-crypt-problems.html


