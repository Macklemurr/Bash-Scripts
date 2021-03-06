#!/bin/sh
#-Usage: adduser <option> <username> <group>
help_page () {
	echo "Usage: adduser <option> <argument> <argument> <modifier>" ;
	echo "---------------------------" ;
	echo "OPTIONS:" ;
	echo "-U <username> <modifier>>: adds a user, by default a home directory is made" ;
	echo "-G <username> <group>: Creates a user to a group" ;
	echo "-P <username>: changes a user password" ;
	echo "-id or --change-id <user id> <username>: changes an existing user's UID" ;
	echo "---------------------------" ;
	echo "Modifiers:" ;
	echo "----User-----" ;
	echo "-U: -nh, --no-home: creates a user with no home directory" ;
	echo "-U: -rd, --recursive-delete: deletes a user with their home directory and mail spool" ;
	echo "-U: -d, --delete: deletes a user but retains their home and mail spool directory"
	echo "----Group----" ;
	echo "-G: -e, --existing, adds an existing user to a group" ;
	echo "-G: -d, --delete, de" ;
	exit 0	
}
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
invalid_mod() {
	case $3 in
		* ) echo "Invalid Modifier: Please user 'adduser -h' for help" ; exit 1 ;;
	esac	       
}
while [ $(($#)) -eq 0 ] || [ $(($#))  -ge 6 ]; do  
	echo "Please use 'adduser -h' to see correct usage."
	echo $?
	exit 0
done
while [ "$(($#))" != 0 ] && [ "$(($#))" != 5 ]; do
	case $1 in
	-U ) # User 
		sudo_check ; 
			if [ "$3" = --no-home ] || [ "$3" = -nh ];  then
				sudo useradd -M "$2"; [ "$?" = 9 ] && exit 9 || echo "User $2 was created with no home directory"; exit 0
			elif [ "$3" = -d ] || [ "$3" = --delete ]; then 
				sudo userdel "$2"; [ "$?" = 6 ] && exit 6 || echo "$2 has been deleted :)"; exit 0
			elif [ "$3" = -rd ] || [ "$3" = --recursive-delete ] ; then 	
				sudo userdel -r "$2"; [ "$?" = 6 ] && exit 6 || echo "$2 was deleted"; exit 0
			fi 
		sudo useradd -m "$2"; [ "$?" = 9 ] && exit 6 || echo "$2 was created with a home directory" ; exit 0 ;; 
	-h ) # Help  
		help_page ;; 
	-G )	# Group 
		sudo_check ; 
			if  [ "$4" = -e ] ; then
				sudo groupmod -a "$2" -G "$3" ;
			       	echo "$2 is added to group $3" ; exit 0		
			elif  [ "$4" = -d ] ; then
				sudo 
			fi
		sudo useradd -m "$2" -G "$3" ;
		echo "User $2 is created with the group  $3" ; exit 0 ;;
	-P )  
		sudo_check ; sudo passwd "$2" ; echo "$2's password has changed" ; exit 0 ;;
	esac
done

