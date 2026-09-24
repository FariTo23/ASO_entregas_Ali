#!/bin/bash
read -p "Introduce el primer número:" num1
read -p "Introduce el segundo número:" num2

menu() {
    echo "***CALCULADORA***"
    echo "    1-SUMAR"
    echo "    2-RESTAR"
    echo "    3-MULTIPLICAR"
    echo "    4-DIVIDIR"
    echo "    0-SALIR"
    read -p "Introduce una opción:" opcion

    case $opcion in
        1) sumar ;;
        2) restar ;;
        3) multiplicar ;;
        4) dividir ;;
        0) salir ;;
        *) echo "Opción no válida" ;;
    esac
}

sumar() {
    resultado=$(($num1 + $num2))
    echo "El resultado de la suma es: $resultado"
}

restar() {
    resultado=$(($num1 - $num2))
    echo "El resultado de la resta es: $resultado"
}

multiplicar() {
    resultado=$(($num1 * $num2))
    echo "El resultado de la multiplicación es: $resultado"
}

dividir() {
    resultado=$(($num1 / $num2))
    echo "El resultado de la división es: $resultado"
}

salir() {
    echo "Saliendo de la calculadora..."
    exit 0
}

opcion=-1
while [[ $opcion -ne 0 ]]; do
    menu
done