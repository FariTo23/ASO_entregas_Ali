#!/bin/bash
if [ $# -eq 0 ]; then
    echo "Uso: $0 numero_de_dias"
    exit 1
fi

# Comprobar que es un numero de 1 a 3 digitos
if ! echo "$1" | grep -Eq '^[0-9]{1,3}$'; then
    echo "Error: $1 no es un número de días válido"
    exit 1
fi

if [ ! -f login.defs ]; then
    echo "Error: no se encuentra el fichero login.defs"
    exit 1
fi

# Valor actual
echo "Antes:"
grep "^PASS_MAX_DAYS" login.defs

# Cambio con copia de respaldo login.defs.bak
sed -i.bak -E "s/^(PASS_MAX_DAYS)[[:space:]]+[0-9]+/\1 $1/" login.defs

echo "Después:"
grep "^PASS_MAX_DAYS" login.defs
