#!/bin/bash

DATA=/home/lohana/LXS2_lmontoya/src/problema2/hojasDatos
OUT_DATA=$DATA/archivos_csv
GRAF_DATA=$DATA/datos_graf
FULL_DATA=$DATA/full_datos

#Aquí se crean las 3 carpetas
mkdir $DATA/archivos_csv
mkdir $GRAF_DATA
mkdir $FULL_DATA
m=0

#este for convierte los archivos .xlx a .csv y guarda los errores en un archivo llamado error1.log

for i in `find $DATA -name '*.xls' `
do
        echo "Procesando archivo $i"
        xls2csv $i > $OUT_DATA/data-$m.csv
        let m=m+1
done 2> error1.log

m=0

#Este for cambia los archivos .csv en .dat para que puedan ser graficados y guarda los errores en un archivo llamado error2.log

for e in `find $OUT_DATA -name "*.csv"`
do
        echo "Dando formato de datos para graficar archivo $e"
        cat $e | awk -F "\",\"" '{print $1 " " $2 " " $3 " " $4 " " $5 " " $6}' | sed '1,$ s/"//g' | sed '1 s/Mes/#Mes/g' > $GRAF_DATA/graf-$m.dat
        let m=m+1
done 2> error2.log

#Este condicional elimina el archivo full.dat ya que si corre varias veces
#entonces se agregaran mas datos al archivo en lugar de crearlo con los
#datos generados. O sea, se agregan por cada corrida un duplicado de los mismo
#s datos.
if [ -a $FULL_DATA/full.dat ]
then
        rm $FULL_DATA/full.dat
        echo "Archivo full.dat borrado"
fi 2> errorIf.log

#Este for crea el archivo full.dat que contiene todos los datos .xls en un solo archivo

for k in `find $GRAF_DATA -name "*.dat"`
do
        sed '1d' $k >> $FULL_DATA/full.dat
        echo "Procesando archivo $k"
done 2> error3.log


FMT_BEGIN='1'
FMT_END='6'
#FMT_X_SHOW=%H:%M
DATA_DONE=$FULL_DATA/full.dat

#Manejamos el rango de la grafica a traves de las variables FMT_BEGIN Y FTM_END.
# La linea plot ... using 1:2 ... indica que columnas del archivo full.dat se deben graficar.
graficar()
{
        gnuplot << EOF 2> error.log
	set xdata time
	set timefmt "%m"
	set xrange ["$FMT_BEGIN" : "$FMT_END"]
#	set format x "$FMT_X_SHOW"
	set terminal png
	set output 'fig1.png'
	plot "$DATA_DONE" using 1:2 with lines title "Agua","$DATA_DONE" using 1:3 with linespoints title "Luz"
EOF

}

graficar



