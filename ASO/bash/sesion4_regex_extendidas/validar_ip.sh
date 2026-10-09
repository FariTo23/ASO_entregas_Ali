#!/bin/bash
re='^[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}$'
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <direccion_ip>"
    exit 1
fi

if [[ "$1" =~ $re ]]; then
    echo "$1 tiene formato de IP"
else
    echo "$1 no tiene formato de IP"
fi