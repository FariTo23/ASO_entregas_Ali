#!/bin/bash
re_privada='^(10\.|192\.168\.|172\.(1[6-9]|2[0-9]|3[01])\.)'
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <direccion_ip>"
    exit 1
fi
ip="$1"
if [[ "$ip" =~ ^127\. ]]; then
    echo "$ip es una dirección loopback"
elif [[ "$ip" =~ $re_privada ]]; then
    echo "$ip es una dirección privada"[cite: 4]
else
    echo "$ip es una dirección pública"[cite: 4]
fi
