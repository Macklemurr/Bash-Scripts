#!/bin/sh
#-Usage: adduser <option> <username> <group>
sudo_check() {
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
while [ $(($#)) -eq 0 ] || [ $(($#)) -ge 6 ]; do  
	echo "Please use 'adduser -h' to see correct usage."
	exit 0
done
while [ "$(($#))" != 0 ] && [ "$(($#))" != 5 ]; do
	case $1 in
	-a ) 
		sudo_check ; 
			if [ "$3" = --no-home ]; then
				sudo useradd -M "$2"
				echo "User $2 was created with no home directory"
				exit 1
			fi
		sudo useradd -m "$2" ;
		echo "$2 was created with a home directory" ;
	        exit 1 	
		;;
	-h ) 
		echo "Usage: adduser <option> <username> <argument> <modifier>" ;
		echo "---------------------------" ;
		echo "OPTIONS:" ;
		echo "-a <username>: adds a user" ;
		echo "-aG <username> <group>: Creates a user to a group" ;
		echo "-d <username>: deletes a user" ;
		echo "-p <username>: changes a user password" ;
		echo "-id or --change-id <user id> <username>: changes an existing user's UID" ;
		echo "---------------------------" ;
		echo "Modifiers:" ;
		echo "-a: --no-home, creates a user with no home directory" ;
		exit 1 
		;;
	-aG )	
		sudo_check ;
		sudo useradd -m "$2" -G "$3" ;
		echo "$2 is added to group $3" ;
		exit 1 
		;;
	-id )
		sudo_check ;
		sudo 
		;;
	-d )  
		sudo_check ;
		sudo userdel -r "$2" ;
		echo "$2 has been deleted" ; 
		exit 1
		;;
	-p )  
		sudo_check ;
		sudo passwd "$2" ;
		echo "$2's password has changed" ;
		exit 1 
		;;
	esac
done
