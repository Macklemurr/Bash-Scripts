#!/bin/bash
PAC=$(pacman -Qdtq | wc -l)
echo "There are $PAC unneeded dependencies! Would you like to remove them? y/n:"
read input

if [ $input == y ]; then
	sudo pacman -Rns $(pacman -Qdtq) --noconfirm

elif [ $input == n ]; then
	exit 1
fi
