#!/bin/bash
if [ $# -ne 2 ]; then
    echo "Uso: $0 usuario ruta_shell"
    exit 1
fi

if [ ! -f passwd ]; then
    echo "Error: no se encuentra el fichero passwd"
    exit 1
fi

# Comprobar que el usuario existe
if ! grep -q "^$1:" passwd; then
    echo "Error: el usuario $1 no existe"
    exit 1
fi

# Comprobar que la shell es valida
if ! echo "$2" | grep -Eq '^(/bin/bash|/bin/sh|/bin/zsh)$'; then
    echo "Error: la shell debe ser /bin/bash, /bin/sh o /bin/zsh"
    exit 1
fi

# Solo se modifica la linea del usuario: se cambia el ultimo campo (la shell)
# Se guarda copia de respaldo passwd.bak
sed -i.bak "/^$1:/s|:[^:]*$|:$2|" passwd

# Mostrar la linea resultante
grep "^$1:" passwd

# PREGUNTA TEORICA:
# ¿En un sistema real se cambia la shell editando /etc/passwd con sed? ¿Qué comando se usa?
# RESPUESTA: No. En un sistema real no se edita directamente /etc/passwd con sed,
# para evitar corrupciones o bloqueos del fichero. Se utiliza el comando oficial
# 'chsh' (o 'usermod -s').
