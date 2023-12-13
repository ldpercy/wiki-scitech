# ssh & keychain for Github

This process will create ssh authentication and signing keys for github with the following names:

	authentication-key
	signing-key

We'll also install and setup keychain to automatically make these available on a per-local-login basis.

N.B. Although this is intended for Github, the process for Gitlab is virtually identical.

1. Create the authentication and signing ssh keys
2. Create ssh config file for authentication with github
3. Set local git to use the signing key
4. Setup keychain to load the ssh keys
5. Add keys to github


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
Main documentation: https://www.funtoo.org/Funtoo:Keychain 

A couple of very helpful youtube vids:  https://www.youtube.com/watch?v=XRdybTxW8K4  https://www.youtube.com/watch?v=qirOF6NQc00


	sudo apt install keychain

Add the following to .bashrc

	eval 'keychain --agents ssh --eval ~/.ssh/authentication-key ~/.ssh/signing-key'


This will now prompt for your passphrase the first time you open a terminal per your local user login (to make the keys available for authentication and signing). If you don't need these often keep the eval line as a snippet or set an alias.



## Add keys to github

Log into your github account and head to https://github.com/settings/keys

Add the authentication and signing ssh keys (.pub files), taking care to specify the key type for each correctly.



