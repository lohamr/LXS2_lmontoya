#!/bin/bash

#Ejemplo de clase, determina si la distro est[a soportada

shop -s nocasematch

DISTRO=$1



case "$DISTRO" in
	Ubuntu)
		echo "Distrubicion $DISTRO soportada"
	;;
	Centos)
		echo "Distrubicion $DISTRO soportada"
	;;
	Fedora)
		echo "Distribucion $DISTRO soportada"
	;;
	*)
		echo "Distribucion no soportada"
esac
