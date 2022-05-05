#!/bin/bash
echo -e "Enter User: \c"
read input
ps -u $input | awk {'print $1, $4'} | sort -n

