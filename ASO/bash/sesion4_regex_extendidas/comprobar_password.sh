#!/bin/bash
p="$1"
segura=1
if [[ $# -eq 0 ]]; then
    echo "Uso: $0 <password>"
    exit 1
fi

for regla in "Tiene al menos 12 caracteres:.{12,}" \
             "Contiene algún dígito:[0-9]" \
             "Contiene alguna mayúscula:[A-Z]" \
             "Contiene algún símbolo:[^a-zA-Z0-9]"
do
    texto="${regla%%:*}"
    regex="${regla#*:}"

    if [[ "$p" =~ $regex ]]; then
        echo "$texto: sí"
    else
        echo "$texto: no"[cite: 3]
        segura=0
    fi
done

if grep -q -i "^$p$" /usr/share/dict/spanish 2>/dev/null; then
    echo "No es una palabra del diccionario: no"[cite: 3]
    segura=0
else
    echo "No es una palabra del diccionario: sí"[cite: 3]
fi

# --- RESULTADO FINAL ---
if [[ $segura -eq 1 ]]; then
    echo "La contraseña es segura"[cite: 3]
else
    echo "La contraseña no es segura"[cite: 3]
fi