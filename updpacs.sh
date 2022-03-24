#!/bin/bash
clear
# Queries available packages and lists the number of lines
pac=$(/usr/bin/pacman -Qu | wc -l)

while [ $pac -ge 1 ]; 
do
echo "There are $pac Packages that need to be updated! Would you like to update now? y/n: " 
read input 

	if [ $input ==  y ]; then
		sudo pacman -Syyu --noconfirm 

	elif [ $input == n ]; then
		echo "Exiting Package Updater!"
		exit 1
	fi
done
while [ $pac == 0 ];
do
	echo "No Packages need Updating! Exiting now."
	exit 1
done
