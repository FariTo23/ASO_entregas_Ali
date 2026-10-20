#!/bin/bash
fichero=${1:-/etc/login.defs}

if [[ ! -f $fichero ]]; then
    echo "Error: El fichero $fichero no existe."
    exit 1
fi

totales=0
utiles=0

re_comentario_vacia='^[[:space:]]*#|^[[:space:]]*$'

while read -r linea; do
    ((totales++))
    if [[ ! $linea =~ $re_comentario_vacia ]]; then
        echo "$linea"
        ((utiles++))
    fi
done < "$fichero"

echo "Líneas totales: $totales"
echo "Líneas útiles: $utiles"