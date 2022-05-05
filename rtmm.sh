#!/bin/bash
#--Memory-Realtime-Monitor-----------------#
#--Monitor your memory usage in real time--#
#--using this script-----------------------#
echo -e "Please make a selection: (k)ilobyte (m)egabyte (g)igabyte: \c"
read mem
echo -e "Time to run: 3 (lowest) - 15 (highest) \c"
read time
top -E $mem -n $time | grep Mem --color=none  


