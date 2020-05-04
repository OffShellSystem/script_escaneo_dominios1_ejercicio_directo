#!/bin/bash
#Script en bash para dominios

color_rojo="\e[31;1m"
color_reset="\e[0m"
color_verde="\e[32;1m"

trap salir INT

echo -e "${color_rojo}Comprobando instalación de herramientas${color_reset}"

sudo apt-get -y install whatweb net-tools

function what() {
whatweb $dominio
}

function pi(){
ping -c 10  $dominio
}

function cu(){
curl $dominio
} 

function salir(){
exit
}

echo -e "${color_rojo}Introduce dominio a escanear${color_reset}"

read -p "-> " dominio

while :
do

	echo -e "${color_verde}Opciones"
	echo -e "1. Usar WhatWeb"
	echo -e "2. Usar Ping"
	echo -e "3. Usar Curl"
	echo -e "4. Salir"
echo -e "${color_rojo}¿Que utilizamos?"
echo -ne "${color_rojo}Opción [1 -4]${color_reset}"
read opcion

case $opcion in
	1)echo "Procesando WhatWeb sobre" $dominio
	what $dominio;;
	2)echo "Procesando Ping sobre" $dominio
	pi $dominio;;
	3)echo "Procesando Curl sobre" $dominio
	cu $dominio;;
	4)echo "Salir"
	exit;;
esac
done
exit
