#!/bin/bash
bytes_a_gb() {
    echo "scale=2; $1 / 1073741824" | bc    

}
echo "Recuerda que 1 GB = 1073741824 bytes"
read -p "Escribe el numero de bytes: " bytes
bytes_a_gb $bytes