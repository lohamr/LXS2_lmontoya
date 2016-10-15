#!/bin/bash

#Ejemplo de clase, determina si la distro est[a soportada

shopt -s nocasematch

DISTRO=$1

#Las funciones se deben definir antes de ser llamadas.
mensaje ()
{
echo "Distrubicion $DISTRO soportada"
}

case "$DISTRO" in
	Ubuntu)
		mensaje
	;;
	Centos)
		mensaje
	;;
	Fedora)
		mensaje
	;;
	*)
		echo "Distribucion no soportada"
esac
