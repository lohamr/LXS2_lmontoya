#!/bin/bash

#Ejemplo de clase, determina si la distro est[a soportada

shopt -s nocasematch

DISTRO=$1

#Las funciones se deben definir antes de ser llamadas.
mensaje ()
{
echo "Distrubicion $1 soportada"
}

case "$DISTRO" in
	Ubuntu)
		mensaje $DISTRO
	;;
	Centos)
		mensaje $DISTRO
	;;
	Fedora)
		mensaje $DISTRO
	;;
	*)
		echo "Distribucion no soportada"
esac
