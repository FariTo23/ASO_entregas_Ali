#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Uso: $0 fichero_configuracion"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: el fichero $1 no existe"
    exit 1
fi

# Un solo sed: borra comentarios (con espacios previos opcionales) y lineas vacias o solo con espacios
sed '/^[[:space:]]*#/d; /^[[:space:]]*$/d' "$1"
