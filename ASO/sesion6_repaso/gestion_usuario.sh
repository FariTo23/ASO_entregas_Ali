#!/bin/bash

ACCION=$1

mostrar_error() {
    echo "Error: $1"
    echo "Uso: ./gestion_usuarios.sh alta | baja identificador"
    exit 1
}

generar_id() {
    NOM=$(echo "$1" | tr 'A-Z' 'a-z' | cut -c1-2)
    AP1=$(echo "$2" | tr 'A-Z' 'a-z' | cut -c1-2)
    AP2=$(echo "$3" | tr 'A-Z' 'a-z' | cut -c1-1)
    echo "alu$NOM$AP1$AP2"
}

if [ -z "$ACCION" ]; then
    mostrar_error "falta la acción"
fi

if [ "$ACCION" != "alta" ] && [ "$ACCION" != "baja" ]; then
    mostrar_error "la acción $ACCION no es válida"
fi

if [ "$ACCION" = "alta" ]; then
    read -p "Nombre: " NOMBRE
    read -p "Apellidos: " APELLIDOS

    if [[ ! $NOMBRE =~ ^[a-zA-Z]+$ ]]; then
        mostrar_error "escribe el nombre con una sola palabra formada por letras"
    fi

    if [[ ! $APELLIDOS =~ ^[a-zA-Z]+\ [a-zA-Z]+$ ]]; then
        mostrar_error "escribe los dos apellidos separados por un espacio"
    fi

    APE1=$(echo "$APELLIDOS" | cut -d' ' -f1)
    APE2=$(echo "$APELLIDOS" | cut -d' ' -f2)

    ID=$(generar_id "$NOMBRE" "$APE1" "$APE2")
    echo "Identificador generado: $ID"

    if id "$ID" &> /dev/null; then
        mostrar_error "el usuario $ID ya existe"
    fi

    echo "Para crearlo: sudo useradd -m -s /bin/bash -c \"$NOMBRE $APELLIDOS\" $ID"
fi

if [ "$ACCION" = "baja" ]; then
    ID=$2

    if [ -z "$ID" ]; then
        mostrar_error "falta el identificador"
    fi

    # Formato aluXXYYZ (alu + 5 letras minusculas)
    if [[ ! $ID =~ ^alu[a-z]{5}$ ]]; then
        mostrar_error "$ID no tiene el formato aluXXYYZ"
    fi

    if ! id "$ID" &> /dev/null; then
        mostrar_error "el usuario $ID no existe"
    fi

    echo "Para eliminarlo: sudo userdel -r $ID"
fi