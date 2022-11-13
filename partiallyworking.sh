#!/bin/bash
cd ~/Documents/
clear
echo What is the name of the HackTheBox machine?
read -p ": " htbname
echo What is the IP of the HackTheBox machine?
read -p ": " htbip
mkdir $htbname
chmod -R 777 $htbname
cd $htbname/
command1='/bin/bash/ -c "cd ~/Documents/${htbname}"'
echo $command1
read -p ": " debugger1
for i in {1..2}
do
	gnome-terminal -- '${command1}'
	xterm -e $command1
	konsole -e $command1
done
#clear
printf "\n%s\t www.%s.htb %s.htb\n" $htbip $htbname $htbname >> /etc/hosts
nmap $htbip -F -oA nmap_FastScan
nmap $htbip -p- -T4 -oA nmap_AllPortScan
nmap $htbip -p- -T4 -A -oA nmap_AllPortScan_A
dirb https://$htbip/ -o dirb_httpsIP
chmod -R 777 ~/Documents/$htbname 
fqdn="https://{htbname}.htb/"
dirb $fqdn -o dirb_httpsFQDN
nmap $htbip -p- -sU -A -oA nmap_AllPortScan_UDP 
