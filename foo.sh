#!/bin/sh
# This is a list of useful function to use
# in shell scripting, use this for when you
# want to source out your scripts

sudo_check() { # Checks to see if you are sudo, if not then does sudo to grant authentication
	if [ "$(id -u)" -eq 0 ]; then
		echo "You shall pass!"
	else 
		if sudo 2> /dev/null true; then
			echo "Sudo Authenticated :)"
		else
			echo "Wrong Password :(" 
			exit 1
		fi
	fi
}

