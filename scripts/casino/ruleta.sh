#!/bin/bash

#Colors
greenColor="\e[0;32m\033[1m"
endColor="\033[0m\e[0m"
redColor="\e[0;31m\033[1m"
blueColor="\e[0;34m\033[1m"
yellowColor="\e[0;33m\033[1m"
purpleColor="\e[0;35m\033[1m"
cianColor="\e[0;36m\033[1m"
grayColor="\e[0;37m\033[1m"


function ctrl_c(){
	echo -e "\n-- ${redColor}saliendo${endColor} xx --"
	exit 1
}

function helpPanel(){
	echo -e "\n-- ayuda: $0"
	echo -e "\t-m) dinero con el que jugar"
	echo -e "\t-t) tecnica a utilizar: martingala/labrouchere"
	exit 1
}

function martingala(){
	echo -e "\n martin GA la"
	echo -e "\tdinero actual ${greenColor}$ $money ${endColor}"
	echo -ne "+ cuanto dinero apostar -> " && read initial_bet
	echo -ne "+ a que le apostamos (par/impar)? -> " && read par_impar
	
	echo -e "\nvamos a jugar ${yellowColor}$initial_bet${endColor} a ${redColor}$par_impar${endColor}"

	backup_bet=$initial_bet
	play_counter=1

	while true; do
		money=$(($money-$initial_bet))
		echo -e "apostaste $initial_bet y te queda $money"
		random_number="$(($RANDOM % 37))"
		echo -e "\n -- ha salido el ${yellowColor}$random_number${endColor}"

		if [ ! "$money" -le 0 ]; then
			if [ "$par_impar" == "par" ]; then
				if [  "$(($random_number % 2))" -eq 0 ]; then
					if [ $random_number -eq 0 ]; then 
						echo "salio el 0, perdido"
					else
						echo -e "\t++++${greenColor}salio un numero par, ganas${endColor}"
						reward=$(($initial_bet * 2))
						echo -e "ganaste ${cianColor}$reward${endColor}"
						money=$(($money+$reward))
						echo -e "${yellowColor}ahora tenes $money${endColor}"
						initial_bet=$backup_bet
					fi
				else
					echo -e "\t----- ${redColor}salio un numero impar, perdes${endColor}"
					initial_bet=$(($initial_bet*2))
					echo -e "ahora tienes $money"
				fi

				sleep 0.2
			fi
		else
			echo -e "\n\n${purpleColor}[!] ya no tienes dinero !!!!!!!!!${endColor}"
			echo -e "han habido $play_counter jugadas" 
			exit 0
		fi
		
		let play_counter+=1
	done
}

function labrouchere(){
	echo -e "\n la brou chere"
	echo -e "\tdinero actual ${greenColor}$ $money ${endColor}"
	echo -ne "+ a que le apostamos (par/impar)? -> " && read par_impar
	declare -a my_seq=(1 2 3 4)
	echo -e "\ncomenzamos con la secuencia [ ${my_seq[@]} ]"

	bet=$((${my_seq[0]} + ${my_seq[-1]}))
	money=$(($money - $bet))

	echo -e "invertimos $bet"
	echo -e "tenemos $money"

	while true; do
		random_number=$(($RANDOM % 37))

		echo -e "\n++ ha salido el ${yellowColor}[ $random_number ]${endColor}"

		if [ "$par_impar" == "par" ] && [ "$random_number" -ne 0 ]; then
			if [ "$(($random_number % 2))" -eq 0 ]; then
				echo -e "el numero es par, ${greenColor}-> GANAS!${endColor}"
				reward=$(($bet * 2))
				let money+=$reward
				echo -e "ahora tienes $money"
				my_seq+=($bet)
				echo -e "nuestra nueva secuencia es [ ${my_seq[@]} ]"
				
				if [ "${#my_seq[@]}" -ne 1 ]; then
					bet=$((${my_seq[0]} + ${my_seq[${#my_seq[@]}-1]}))
				else
					bet=${my_seq[0]}
				fi
			else
				echo -e "el numero es impar,${redColor} -> PERDES!${endColor}"
				unset my_seq[0]
				unset my_seq[-1] 2>/dev/null

				my_seq=(${my_seq[@]})
				echo -e "la secuencia ahora es [ ${my_seq[@]} ]"
				bet=$((${my_seq[0]} + ${my_seq[-1]}))
				echo -e "ahora tienes $money"	
			fi
		elif [ "$random_number" -eq 0 ]; then
			echo -e "ha salido el 0, ${redColor} -> PERDES!${endColor}" 
		fi
		sleep 10
	done
}

trap ctrl_c INT

while getopts "m:t:h" arg; do
	case $arg in
		m) money=$OPTARG;;
		t) technique=$OPTARG;;
		h) helpPanel;;
	esac
done

if [ $money ] && [ $technique ]; then
	echo "dinero: $money y tecnica $technique"
	if [ "$technique" == "martingala" ]; then
		martingala
	elif [ "$technique" == "labrouchere" ]; then
		labrouchere
	else
		echo -e "\n-- las tecnicas son martingala y labrouchere"
	fi
else
	helpPanel
fi
