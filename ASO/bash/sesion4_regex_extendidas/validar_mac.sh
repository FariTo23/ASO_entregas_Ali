#!/bin/bash
re='^([0-9a-fA-F]{2}[:-]){5}[0-9a-fA-F]{2}$'
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <direccion_mac>"
    exit 1
fi

if [[ "$1" =~ $re ]]; then
    echo "$1 es una MAC válida"
else
    echo "$1 no es una MAC válida"
fi