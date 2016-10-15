#!/bin/bash

#Ejemplo de clase, determina si la distro est[a soportada

shopt -s nocasematch

DISTRO=$1
VAR2=$2
VAR3=$3

#Las funciones se deben definir antes de ser llamadas.
mensaje ()
{
echo "Distrubicion $1 soportada"
echo "Distrubicion $2 soportada"
echo "Distrubicion $3 soportada"

CONTADOR=1

for i in $@
do
	echo "El parametro de la funcion fueron $i"
	let "CONTADOR=$CONTADOR+1"
done
}

case "$DISTRO" in
	Ubuntu)
		mensaje $DISTRO $VAR2 $VAR3
	;;
	Centos)
		mensaje $DISTRO $VAR2 $VAR3
	;;
	Fedora)
		mensaje $DISTRO $VAR2 $VAR3
	;;
	*)
		echo "Distribucion no soportada"
esac
