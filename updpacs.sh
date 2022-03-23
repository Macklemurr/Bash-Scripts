#!/bin/bash
# Queries available packages and lists the number of lines
pac=$(pacman -Qu | wc -l)

# Needs to Sync the repostiory before querying for packages that need to be updated
sudo pacman -Syy

echo "There are $pac Packages that need to be updated! Would you like to update now? y/n: " 
read input 

if [ $input ==  y ]; then
	sudo pacman -Su # --noconfirm 

elif [ $input == n ]; then
	exit 1
fi

