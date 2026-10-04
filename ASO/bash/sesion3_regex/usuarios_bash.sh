#!/bin/bash
count=0
re_bash='bash$'

while read -r linea; do
    if [[ $linea =~ $re_bash ]]; then
        usuario=${linea%%:*}
        echo "$usuario"
        ((count++))
    fi
done < /etc/passwd

echo "Usuarios con bash: $count"