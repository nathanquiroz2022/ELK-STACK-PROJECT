#!/bin/bash
#output=/home/sysadin/research/sys_info2.txt
output=$HOME/research/sys_info.txt
#mkdir ~/new_research 2>/dev/null
if [ $UID -ne 0 ];then
	echo ""please run the script as root
	exit
fi

if [! -d $HOME/research ];then
        echo "Creating directory.."
        mkdir $HOME/research
fi
if [ -f $output ];then
	echo "file exists and we should remove it .."
	rm $output
fi
echo "This is a practice script" > $output
echo ""
echo " Today is $(date |awk -F " " '{print $1,$2,$3,$6}')"  >>  $output
echo "" >> $output
echo "machine type:"
echo $MACHTYPE >> output
echo "the uname: -e $(uname -a)\n" >> $output
echo -e "my machine IP address is: $(ip route get 8.8.4.4 |head -1 |awk '{print $7}')\n" >> -p $output
echo "" >> $output
echo "The host name is: $(hostname -s)" >>  $output
echo "The DNS info is: $(grep nameserver /etc/resolv.conf |tail -l|awk -F " " '{print $2,$3,$4,$5}'|tail -1)" >> $output
echo ""
echo "Display my memory info: $(free)" >> $output
echo ""
echo "Display my CPU info: $(lscpu |grep CPU)" >>  $output
echo ""
echo ""
echo "The Current logged on users are: $(w)" >>  $output
find -type f -perm 777 >>  $output
ps -aux |head >>  $output


