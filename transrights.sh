#!/bin/bash
red="\e[0;91m"
blue="\e[0;94m"
green="\e[0;92m"
green_bg="\e[0;102m"
blue_bg="\e[0;104m"
red_bg="\e[0;101m"
white="\e[0;97m"
expand_bg="\e[K"
reset="\e[0m"
uline="\e[4m"
bold="\e[1m"
for (( ; ; ));
do
	echo -e "${blue_bg}${expand_bg}${reset}"
	echo -e "${red_bg}${expand_bg}${reset}"
	echo -e "${red_bg}${expand_bg}${reset}" 
	echo -e "${red_bg}${expand_bg}${reset}"
	echo -e "${blue_bg}${expand_bg}${reset}"
done
