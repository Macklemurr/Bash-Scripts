#!/bin/bash
clear
# Queries available packages and lists the number of lines
pac=$(/usr/bin/pacman -Qu | wc -l)
sudo pacman -Syy
while [ $pac -ge 1 ]; 
do
	echo "There are $pac Packages that need to be updated! Please select an input: (y)es/(n)o/(l)ist packages: " 
read input 
	if [ $input ==  y ]; then
		sudo pacman -Su --noconfirm 
		echo "$pac Packages have been updated!"	
		break
	elif [ $input == n ]; then
		echo "Exiting Package Updater!"
		sleep 2
		exit 1
	elif [ $input == l ]; then
		pacman -Qu
	fi
done
while [ $pac == 0 ];
do
	echo "No Packages need Updating! Exiting now."
	sleep 2
	exit 1
done
