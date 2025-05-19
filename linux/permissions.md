Permissions
===========


Basic permissions
-----------------

rwxrwxrwx

	rwx owner
	rwx group
	rwx	everyone

	0	---
	1	--x
	2	-w-
	3	-wx
	4	r--
	5	r-x
	6	rw-
	7	rwx

	s	SUID or SGID
	S	SUID or SGID, but not executable (problem)
	t	sticky bit


SUID and SGID
-------------

### SUID - 's' in owner

	-rws------

When the SUID bit is set on an executable file, this means that the file will be executed with the same permissions as the owner of the executable file.


### SGID - 's' in group

	-rwxrws---

On a file: any user executing the file will have same permissions as the group owner of the file.

On a directory: any files created in the directory will have their group ownership set to that of the directory owner

https://linuxhandbook.com/suid-sgid-sticky-bit/


chmod
-----

	u	User, meaning the owner of the file.
	g	Group, meaning members of the group the file belongs to.
	o	Others, meaning people not governed by the u and g permissions.
	a	All, meaning all of the above.

	-	removes the permission
	+	add the permission to the existing permissions
	=	set the permission and remove others

	r	read
	w	write
	x	execute

	s	SUID or SGID


https://www.howtogeek.com/437958/how-to-use-the-chmod-command-on-linux/



umask
-----

Umask is stateful, and inherited by processes.
Can be set in the terminal, or defaulted for the session in bashrc.

Umask is inverted from ordinary octal permissions

Settings:
	`0002` common for ubuntu.



Directory quirks
----------------

There are details:

https://unix.stackexchange.com/questions/21251/execute-vs-read-bit-how-do-directory-permissions-in-linux-work

Read bit = You can read the names on the list.
Write bit = You can {add,rename,delete} names on the list IF the execute bit is set too.
Execute bit = You can make this directory your working directory.

The read bit (r) allows the affected user to list the files within the directory
The write bit (w) allows the affected user to create, rename, or delete files within the directory, and modify the directory's attributes
The execute bit (x) allows the affected user to enter the directory, and access files and directories inside



Access Control Lists
--------------------

getfacl
setfacl

Permission string ends with `+`, eg:

	-rwxr-xr-x+

https://wiki.archlinux.org/title/Access_Control_Lists


For ext4:
> You can set the default mount options of a filesystem using the tune2fs -o option partition command, for example:



Attributes
----------

lsattr
chattr

https://wiki.archlinux.org/title/File_permissions_and_attributes#File_attributes

eg

	a - append only: File can only be opened for appending.
	c - compressed: Enable filesystem-level compression for the file.
	i - immutable: Cannot be modified, deleted, renamed, linked to. Can only be set by root.
	j - data journaling: Use the journal for file data writes as well as metadata.
	m - no compression: Disable filesystem-level compression for the file.
	A - no atime update: The file's atime will not be modified.
	C - no copy on write: Disable copy-on-write, for filesystems that support it.


Find files by permission
------------------------

Exact:
	find -perm 777 -ls

At least:

	find -perm -766	-ls

Owner group or user:

	find - perm /220 -ls


Examples:

SUID

	find . -perm /4000 -ls


SGID
	find . -perm /2000 -ls

Sticky

	find . -perm /1000 -ls


https://ostechnix.com/find-files-based-permissions/


Refs
----













