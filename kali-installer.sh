#!/bin/bash
foo=$(find / -name foo.sh 2> /dev/null | sed -n '2p;/PATTERN/p')
source $foo
echo "WARNING RUN THIS SCRIPT WITH EXTREME CAUTION YOU COULD MESS UP YOUR DRIVES :3"
echo "I AM NOT RESPONSIBLE FOR ANY LOSS OF DATA BY YOU RUNNING THIS SCRIPT"
sleep 5
clear
lsblk
echo -e "\nWhat device partition would you like to install kali on?: \c"
read part
clear
echo -e "\nWhat type of kali iso? live or installer: \c"
read type
find /home -name "kali-linux-20??.*-$type-*.iso" &> /dev/null 
for iso in $(find /home -name "kali-linux-20??.*-$type-*.iso" 2> /dev/null) ;
do
	echo -e "\nIs this the correct iso?"
	echo $iso
	echo -e "\nY/N: \c"
done
read response
clear
if [ $response == Y ]; then
	sudo_check
	echo "Installing..."
	sudo dd if=$iso of=$part bs=4096 status=progress &
elif  [ $response ==  N ]; then
        echo "Run the script again to get the right iso"	
	exit 1
else
	echo "Wrong Input"
	exit 1
fi



