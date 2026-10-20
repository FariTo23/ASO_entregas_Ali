#!/bin/bash
re='^[a-z0-9._-]+@(alu\.)?edu\.gva\.es$'
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <correo>"
    exit 1
fi

if [[ ! "$1" =~ $re ]]; then
    echo "$1 no es una cuenta educativa"[cite: 2]
elif [[ "$1" =~ @alu\.edu\.gva\.es$ ]]; then
    echo "$1 es una cuenta de alumnado"[cite: 2]
else
    echo "$1 es una cuenta de profesorado"[cite: 2]
fi