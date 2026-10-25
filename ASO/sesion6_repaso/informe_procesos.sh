#!/bin/bash

N=$1

if [ -n "$N" ]; then
    if [[ ! $N =~ ^[0-9]+$ ]]; then
        echo "Error: $N no es un número válido"
        exit 1
    fi
    if [ $N -le 0 ]; then
        echo "Error: el número debe ser mayor que 0"
        exit 1
    fi
fi

ps -u "$USER" -o pid,pcpu,pmem,comm --sort=-pcpu > procesos.txt

if [ -z "$N" ]; then
    cat procesos.txt
else
    LINEAS=$((N + 1))
    head -n $LINEAS procesos.txt
fi

TOTAL=$(ps -u "$USER" --no-headers | wc -l)
echo "----"
echo "Procesos de $USER: $TOTAL"