Github
======



SSH when SSH is restricted
--------------------------
Eg, a public network, library, office etc.

```bash
$ git fetch
ssh: connect to host github.com port 22: Connection refused
fatal: Could not read from remote repository.

Please make sure you have the correct access rights
and the repository exists.
```


Add hostname and port 443 to `~/.ssh/config`:
```conf
Host github.com
  PreferredAuthentications publickey
  IdentityFile ~/.ssh/authentication-key
  Hostname ssh.github.com
  Port 443
```
Yields:
```bash
$ git fetch
The authenticity of host '[ssh.github.com]:443 ([4.237.22.40]:443)' can't be established.
ED25519 key fingerprint is SHA256:+DiY3wvvV6TuJJhbpZisF/zLDA0zPMSvHdkr4UvCOqU.
This host key is known by the following other names/addresses:
    ~/.ssh/known_hosts:1: [hashed name]
Are you sure you want to continue connecting (yes/no/[fingerprint])? y
Please type 'yes', 'no' or the fingerprint: yes
Warning: Permanently added '[ssh.github.com]:443' (ED25519) to the list of known hosts.
```

