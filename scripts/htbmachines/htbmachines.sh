#!/bin/bash


#Colours
greenColour="\e[0;32m\033[1m"
endColour="\033[0m\e[0m"
redColour="\e[0;31m\033[1m"
blueColour="\e[0;34m\033[1m"
yellowColour="\e[0;33m\033[1m"
purpleColour="\e[0;35m\033[1m"
turquoiseColour="\e[0;36m\033[1m"
grayColour="\e[0;37m\033[1m"


#variables globales
main_url="https://htbmachines.github.io/bundle.js"

function ctrl_c(){
	echo -e "\n\n${redColour}[!]${endColour}exiting..."
	exit 1
}

trap crtl_c INT

function helpPanel(){
	echo -e "\n${yellowColour}asi se usaria:${endColour}"
	echo -e "\tm) ${turquoiseColour}buscar por el nombre de la maquina${endColour}"
	echo -e "\th) ${greenColour}mostrar el panel de aiuda${endColour}"
	echo -e "\tu) ${redColour}hacemos update de la data${endColour}"
	echo -e "\td) ${blueColour}buscar una maquina por dificultad${endColour}"
	echo -e "\ti) ${yellowColour}buscar por direccion IP${endColour}"
	echo -e "\ty) ${redColour}link de youtube de la resolucion de la maquina${endColour}"
	echo -e "\to) filtrar por SO"
	echo -e "\ts) buscar por skills"
}

function searchMachine(){
	machineName="$1"

	machine_checker="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//')"

	if [ "$machine_checker" ]; then

		echo -e "\n${redColour}estas son las propiedades de${endColour} ${greenColour}$machineName${endColour}\n"
		cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' 
	else 
		echo -e "\nla maquina no existe"
	fi
	
}

function updateFiles(){
	echo -e "\n${turquiseColour}intentando actualizar${endColour}\n"

	sleep 2

	if [ ! -f bundle.js ]; then
	echo -e "\n${yellowColour}descargando archivo bundle.js${endColour}"
	curl -s $main_url > bundle.js
	js-beautify bundle.js | sponge bundle.js
	echo -e "\n[!] - ${greenColour}archivo descargao${endColour}"
else 
	curl -s $main_url > bundletemp.js
	js-beautify bundletemp.js | sponge bundletemp.js
	md5_temp_value=$(md5sum bundletemp.js | awk '{print $1}')
	md5_original_value=$(md5sum bundle.js | awk '{print $1}')

	if [ "md5_temp_value == md5_original_value" ]; then
		echo -e "[-] ${yellowColour}no hay actualizaciones, es el mismo"${endColour}
		rm bundletemp.js
	else 
		echo -e "[-] ${blueColour}es necesario actualizar"${endColour}
		rm bundle.js && mv bundletemp.js bundle.js

	fi
fi
}

function searchIP(){
	ipAddress="$1"

	machineName="$(cat bundle.js | grep "ip: \"$ipAddress\"" -B 3 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',')"

	searchMachine $machineName

}

function searchLevel(){
	level="$1"

	results_check="$(cat bundle.js | grep "dificultad: \"$level\"" -B 5 | grep "name:" | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

	if [ "$results_check" ]; then
		echo -e "\nestas sonlas maquinas $level"
		cat bundle.js | grep 'dificultad: \"Insane\"' -B 5 | grep name | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column
	else
		echo -e "no existe"
	fi
}

function getYouTube(){
	machineName="$1"

	youtubeLink="$(cat bundle.js | awk "/name: \"$machineName\"/,/resuelta:/" | grep -vE "id:|sku:|resuelta" | tr -d '"' | tr -d ',' | sed 's/^ *//' | grep youtube | awk 'NF {print $NF}')"
	if [ $youtubeLink ]; then
		echo -e "\nesta maquina esta en: $youtubeLink"
	else
		echo -e "\nno existe tal maquina"
	fi
}

function getOS(){
	os="$1"

	os_results="$(cat bundle.js | grep "so: \"$os\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column)"

	if [ "$os_results" ]; then
		echo -e "\nos: $os: "
		cat bundle.js | grep "so: \"Windows\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d ',' | column		
	else
		echo -e "\nno existe ese os"
	fi
}

function getOSLevel(){
	level="$1"
	os="$2"

	check_results="$(cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$level\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d "," | column)"

	if [ "$check_results" ]; then
		echo -e "\n${greenColour}las maquinas $os con dificultad $level son:${endColour}"
		cat bundle.js | grep "so: \"$os\"" -C 4 | grep "dificultad: \"$level\"" -B 5 | grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d "," | column
	else 
		echo -e "\n${redColour}no hay maquinas con ese so y esa dificultad${endColour}"
	fi
}

function getSkill(){
	skill="$1"
	
	check_results="$(cat bundle.js | grep "skills: " -B 6 | grep "$skill" -i -B 6| grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d "," | column)"

	if [ "$check_results" ]; then
		echo -e "\nestas son las maquinas con $skill:\n"
		cat bundle.js | grep "skills: " -B 6 | grep "$skill" -i -B 6| grep "name: " | awk 'NF{print $NF}' | tr -d '"' | tr -d "," | column
	else
		echo -e "\nno hay maquinas con esas skills"
	fi	
}

#indicadores
declare -i parameter_counter=0

#chivatos
declare -i chivato_level=0
declare -i chivato_os=0

while getopts "m:ui:s:d:y:o:h" arg; do
	case $arg in
		m) machineName="$OPTARG"; let parameter_counter+=1;;
		u) let parameter_counter+=2;;
		h) helpPanel;;
		i) ipAddress="$OPTARG"; let parameter_counter+=3;;
		d) level="$OPTARG"; chivato_level=1; let parameter_counter+=4;;
		y) machineName="$OPTARG"; let parameter_counter+=5;;
		o) os="$OPTARG"; chivato_os=1; let parameter_counter+=6;;
		s) skill="$OPTARG"; let parameter_counter+=7;;
	esac
done

if  [ $parameter_counter -eq 1 ]; then
	searchMachine $machineName
elif [	$parameter_counter -eq 2 ]; then
	updateFiles
elif [ $parameter_counter -eq 3 ]; then
	searchIP $ipAddress
elif [ $parameter_counter -eq 4 ]; then
	searchLevel $level
elif [ $parameter_counter -eq 5 ]; then
	getYouTube $machineName
elif [ $parameter_counter -eq 6 ]; then
	getOS $os
elif [ $chivato_level -eq 1 ] && [ $chivato_os -eq 1 ]; then
	getOSLevel $level $os
elif [ $parameter_counter -eq 7 ]; then
	getSkill "$skill"
else
	helpPanel

fi
