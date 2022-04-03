#!/bin/bash

provinces=("ON BC QC AB NS ")
for province in ${provinces[@]}
do
	if [ $province = 'ON' ];then
		echo "I live in Ontario"
	else
		echo "I only want to live in Ontario"
	fi
done

for num in {0..9}
do
	if [ $num -eq 3 ] || [ $num -eq 5 ] || [ $num -eq 7 ];then
		echo $num 
	fi
done

item=$(ls)
for i in ${item};
 do
 echo "$i"
done


logs=(ls -l '/etc/shadow' '/etc/passwd')
for list in ${logs[@]}
do
	ls -lat $list 2>/dev/null 
done

sudoers=$(getent group sudo)
for sudoer in ${sudoers[@]}
do
	echo "User with sudo abilities are.."
	sleep 3
	echo $sudoer | cut -d: -f4
done
