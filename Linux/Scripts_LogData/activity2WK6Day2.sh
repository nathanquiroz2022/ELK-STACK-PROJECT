#!/bin/bash

if [ $UID = '1000' ];then
	echo "you are sysadmin, pleaes wait for next step ..."
	sleep 5
else
	echo " you are sysadmin please wait for next step";
	exit
fi


paths=('/etc/shadow' '/etc/passwd')
for file in ${paths[@]};
 do
ls -lat $file
 done

