#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Uso: $0 fichero_correos"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero $1 no existe"
    exit 1
fi

# Un solo sed con expresion regular extendida
sed -E 's/@(gmail|hotmail)\.com/@alu.edu.gva.es/g' "$1"
