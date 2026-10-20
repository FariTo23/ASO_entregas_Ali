#!/bin/bash
conf_count=0
bak_count=0

re_conf='\.conf$'
re_bak='(\.bak|~)$'

echo "Ficheros de configuración:"

for fichero in /etc/*; do
    if [[ -f $fichero ]]; then
        if [[ $fichero =~ $re_conf ]]; then
            echo "$fichero"
            ((conf_count++))
        elif [[ $fichero =~ $re_bak ]]; then
            ((bak_count++))
        fi
    fi
done

echo "Configuración: $conf_count"
echo "Copias de seguridad: $bak_count"