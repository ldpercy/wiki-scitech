Swap
====

Swappiness
----------

Read current swappiness value:

```bash
cat /proc/sys/vm/swappiness
```

Set temporary swappiness value:

```bash
sudo sysctl vm.swappiness=45
```

Set permanent swappiness value - add this line to /etc/sysctl.conf:

```conf
vm.swappiness=15
```


### Refs

https://www.howtogeek.com/449691/what-is-swapiness-on-linux-and-how-to-change-it/

https://askubuntu.com/questions/103915/how-do-i-configure-swappiness



What's using swap
-----------------

https://stackoverflow.com/questions/479953/how-to-find-out-which-processes-are-using-swap-space-in-linux

```bash
for file in /proc/*/status ; do awk '/Tgid|VmSwap|Name/{printf $2 " " $3}END{ print ""}' $file; done | grep kB  | sort -k 3 -n
```