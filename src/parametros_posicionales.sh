#!/bin/bash
ERRORLOG="$0.err"
#La salida estandar del error estara redireccionada al archivo if-then.sh.err
if cp archivo1.txt archivo1.txt.bck 2> $ERRORLOG    
then
    echo"El archivo.txt fue correctamente respaldado..."
else
    echo"El archivo1.txt no pudo ser respaldado, verifique el log: $errorlog"
fi
