# ssh & keychain for Gitub

This process will create ssh authentication and signing keys for github with the following names:

	authentication-key
	signing-key

We'll also install and setup keychain to automatically make these available on a per-local-login basis.

N.B. Although this is intended for Github, the process for Gitlab is virtually identical

## Create authentication and signing ssh keys
Each of these will ask for a passphrase.

Keyfiles go into ~/.ssh/

	ssh-keygen  -t ed25519  -f ~/.ssh/authentication-key  -C "key for authenticating with github"

	ssh-keygen  -t ed25519  -f ~/.ssh/signing-key  -C "key for signing commits"

Private and public keyfiles are created for each key in ~/.ssh/:

-	authentication-key
-	authentication-key.pub
-	signing-key
-	signing-key.pub

## Create ssh config file for authentication with github.com
Save the following text as ~/.ssh/config

	# GitHub
	Host github.com
	  PreferredAuthentications publickey
	  IdentityFile ~/.ssh/authentication-key




## Set local git to use signing key
https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key#telling-git-about-your-ssh-key


	git config --global gpg.format ssh

	git config --global user.signingkey ~/.ssh/signing-key.pub

	git config --global commit.gpgsign true



## Keychain install and run

	sudo apt install keychain

Add the following to .bashrc

	eval 'keychain --agents ssh --eval ~/.ssh/authentication-key ~/.ssh/signing-key'



## Add keys to github

Log into your github account and head to https://github.com/settings/keys

Add the authentication and signing ssh keys (.pub files), taking care to specify the key type for each correctly.



