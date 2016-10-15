#!/bin/bash


#Primero revisamos que el numero de parametros sea el correcto
#---------------------------------------------------------
#Revision argumentos

#son 3 argumentos
ARGS=3

if [ $# -ne $ARGS  ]
then 
	echo "Error: "
	echo "Uso: $0 <op1> <op2> <op3>"
	exit 1
fi

#---------------------------------------------------------

# Quiero ver cuales fueron los argumentos

echo "Los parametros del scrip fueron: "
echo " "

VAR1=1
#Diferencia entre $@ (es un parametro) y $* (que es un string)

for PARAM in $@
do
	echo "El parametro $VAR1  es: $PARAM"
	let "VAR1=$VAR1+1"
	echo "VAR1 es: $VAR1"
done

for PARAM in "$*"
do
	echo "El parametro $VA
	let "VAR1=$VAR1+1
