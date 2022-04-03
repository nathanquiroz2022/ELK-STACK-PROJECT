#!/bin/bash

for 
	{$USER != 'root' }; then
	echo "You do not have root access "
	exit
done

files=('/etc/shadow' '/etc/passwd')
echo "the permission for these files are as follow.."
for file in ${files[@]};
 do
ls -lat $file
 done

