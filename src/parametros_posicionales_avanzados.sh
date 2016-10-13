#!/bin/bash
#este script respalda tres archivos en caso de que existan, de una manera jerarquica:

if test -e $1 $1.bck
then
	cd $1 $1.bck
	echo "el archivo $1 fue correctamente respaldado..."
elif test -e $2
then
	cp $2 $2.bck
	echo  "el archivo $2 se resplado correctamente"
 
elif test -e $3
then
	cp $3 $3.bck
	echo  "el archivo $3 se resplado correctamente"
else
	echo "no se pudo respaldar ninguno de los archivos> $@"
fi
