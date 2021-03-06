#! /bin/bash
clear
echo -e "Select the Option From below:\n"

echo -e "\n
[ 1 ] For the Disk-Name, Used-Space, Available-Space, and Size \n
[ 2 ] To print the File-Systems \n
[ 3 ] To see all fields in DiskUsage \n"

echo -e "Please type in your option here:" 
read userInput

if [ $userInput == 1 ]; then
	df -h --output=source,used,avail,size,target,pcent | awk '!/^(tmpfs|dev|run)/' 

elif [ $userInput == 2 ]; then
	df -h --output=source,fstype | awk '!/^(tmpfs|dev|run)/' 

elif [ $userInput == 3 ]; then
	df -ha 

else
	echo "Invalid Input: Exiting Script" && exit 1
fi

