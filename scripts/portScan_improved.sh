#!/bin/bash

#crtl+c
function ctrl_c(){
	echo -e "\n[!] - exiting..."
	exit 1
}

trap ctrl_c INT

declare -a ports=( $(seq 1 65535) )

function checkPort(){
	host=$1
	(exec 3<> /dev/tcp/$host/$2) 2>/dev/null

	if [ $? -eq 0 ]; then
		"echo [+] host: $host - port: $port: OPEN"
	fi

	exec 3<&-
	exec 3>&-
}

if [ $1 ]; then
	for port in ${ports[@]}; do 
		checkPort $1 $port &
	done

else
	echo -e "\n[!] use: $0 <ip-address>\n"
fi

wait
