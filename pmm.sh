#!/bin/bash
# pmm - Processor and Memory Monitor
red="\e[0;91m"
blue="\e[0;94m"
expand_bg="\e[K"
blue_bg="\e[0;104m${expand_bg}"
red_bg="\e[0;101m${expand_bg}"
green_bg="\e[0;102m${expand_bg}"
green="\e[0;92m"
white="\e[0;97m"
bold="\e[1m"
uline="\e[4m"
reset="\e[0m"
echo "(p)rocessor or (m)emory, Make a selection: "
read input
if [ $input == m ]; then
	echo "Press Ctrl + C to Exit"
	sleep 2
	for (( ; ; ))
	do
		sleep 3
		cat /proc/meminfo | sed -n -e '1,3p' -e '5,8p'
	done
fi
