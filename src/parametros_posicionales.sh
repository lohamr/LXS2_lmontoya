#!/bin/bash
#La salida estandar....
if cp archivo1.txt archivo1.txt.bck 2> $0.err
then
    echo"El archivo.txt fue correctamente respaldado..."
fi
