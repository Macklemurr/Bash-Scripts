#!/bin/bash
# pmlc - Processor and Memory Log Creator
date="$(date +'%T_%D')"
dir="$HOME/pmlc" # The directory where logs are stored
memlog="$HOME/pmlc/mem" # memory log file
cpulog="$HOME/pmlc/cpu" # cpu log file
if [ ! -d $dir ]; then # Checks if the required dirs doesn't exists
		mkdir -p $dir/mem && mkdir -p $dir/cpu # makes the required dirs
	fi
cat /proc/meminfo | sed -n -e '1,3p' -e '5,6p' -e '15,16p' > $memlog/mem.txt
cat /proc/cpuinfo | sed -n -e '5p' -e '8,9p' -e '33p' -e '36,37p' -e '61p' -e '64,65p' -e '89p' -e '92,93p' -e '117p' -e '120,121p' -e '145p' -e '148,149p' -e '173p' -e '176,177p' -e '201p' -e '204,205p' > $cpulog/cpu.txt
# You will most likely modify the sed part yourself
# 
