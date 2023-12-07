# ssh & keychain for Gitub

This is for Github, but the process for Gitlab is virtually identical


## Create authentication and signing ssh keys
Each of these will ask for a location & passphrase.

Keyfiles go into ~/.ssh/

	ssh-keygen -t ed25519 -C "authentication-key"

	ssh-keygen -t ed25519 -C "signing-key"

Two files are created for each key (4 in total)

	~/.ssh/authentication-key
	~/.ssh/authentication-key.pub
	~/.ssh/signing-key
	~/.ssh/signing-key.pub

## Create ssh config file for authentication with github.com
This file is saved as ~/.ssh/config

	# Default GitHub
	Host github.com
		HostName github.com
		PreferredAuthentications publickey
		IdentityFile ~/.ssh/authentication-key





## Set local git to use signing key
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key#telling-git-about-your-ssh-key


	git config --global gpg.format ssh

	git config --global user.signingkey ~/.ssh/signing-key.pub


## Keychain install and run

	sudo apt install keychain

Add the following to .bashrc

	eval 'keychain --agents ssh --eval ~/.ssh/authentication-key ~/.ssh/signing-key'




## Add keys to github

Log into your github account and head to https://github.com/settings/keys

Add the authentication and signing ssh keys (.pub files), taking care to specify the key type for each correctly.




