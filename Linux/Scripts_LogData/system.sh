#!/bin/bash

# INSTRUCTIONS: 

#Now you will create a script that will execute various Linux tools to parse information about the system. 
#Each of these tools should output results to a text file inside its respective system information directory.
#For example: cpu_usage_tool > ~/backups/cpuuse/cpu_usage.txt
#In the above example, the cpu_usage_tool command will output CPU usage information into a cpu_usage.txt file.
#To get started with setting up your script up in your home directory, do the following:
#Navigate to your home directory by running: cd ~/
#Run the command nano system.sh to open a new Nano window.


#Prints the amount of free memory on the system and saves it to ~/backups/freemem/free_mem.txt
free -mh > awk '/Mem:/ {print $4}' <(free -m) > ~/Projects/backups/freemem/free_mem.txt


#Prints disk usage and saves it to ~/backups/diskuse/disk_usage.txt
du -sh > ~/Projects/backups/diskuse/disk_usage.txt

#Lists all open files and saves it to ~/backups/openlist/open_list.txt
lsof > ~/Projects/backups/openlist/open_list.txt

#Prints file system disk space statistics and saves it to ~/backups/freedisk/free_disk.txt
df -h > ~/Projects/backups/freedisk/free_disk.txt

