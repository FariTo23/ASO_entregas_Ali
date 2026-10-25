#!/bin/bash

DESTINO=${1:-/var/backups}
MAXIMO=${2:-7}

registrar() {
    HORA=$(date +%H:%M:%S)
    echo "$HORA $1"
    logger -t aso-backup "$1"
}

if [ ! -d "$DESTINO" ]; then
    registrar "Error: el directorio $DESTINO no existe"
    exit 1
fi

if [[ ! $MAXIMO =~ ^[0-9]+$ ]]; then
    registrar "Error: $MAXIMO no es un número"
    exit 1
fi

if [ $MAXIMO -le 0 ]; then
    registrar "Error: el número máximo de copias debe ser mayor que 0"
    exit 1
fi

FECHA=$(date +%Y%m%d-%H%M%S)
FICHERO="$DESTINO/etc-$FECHA.tar.gz"
tar -czf "$FICHERO" /etc 2>/dev/null

if [ ! -f "$FICHERO" ]; then
    registrar "Error: no se ha podido crear la copia"
    exit 1
fi
registrar "Copia creada: $FICHERO"

CONTADOR=0
for F in "$DESTINO"/*; do
    NOMBRE=$(basename "$F")
    if [[ $NOMBRE =~ ^etc-[0-9]{8}-[0-9]{6}\.tar\.gz$ ]]; then
        CONTADOR=$((CONTADOR + 1))
    fi
done

if [ $CONTADOR -gt $MAXIMO ]; then
    registrar "Aviso: hay $CONTADOR copias y el máximo recomendado es $MAXIMO"
fi