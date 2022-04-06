#!/bin/bash
echo "Enter User: "
read input
ps -u $input | awk {'print $1, $4'} | sort -n

