#!/bin/sh
foo="$HOME/bash-scripts/foo.sh"
source $foo
echo -e "(A)ppend, (C)heck, (D)elete, or (L)ist?: \c"
read cmd
sudo_check
while [[ $cmd = "A" ]] ; do
	echo "heelo"
done
while [[ $cmd = "C" ]] ; do
	echo "yesssss"
done
while [[ $cmd = "D" ]]; do
	echo "wowowo"
done
while [[ $cmd = "L" ]]; do
	echo "so coool !!! "
done
