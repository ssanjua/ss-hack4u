#!/bin/bash

function ctrl_c(){
	echo -e "\n[!] saliendo"
	exit 1
}

trap ctrl_c INT

for i in $(seq 1 254); do
	for port in $(seq 1 65535); do
		timeout 1 bash -c "echo '' > /dev/tcp/192.168.128.$i/$port" 2>/dev/null && echo "[+] host 192.168.128.$i - ACTIVE - Port $port - OPEN" &
	done
done

wait
