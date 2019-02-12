#!/bin/bash

re='^-*[0-9]+([.][0-9]+)?$'
while true
do
    printf "\nConversion de temperature\n"
    read -p "Entrer la temperature a convertir " n
    while [[ ! $n =~ $re ]]
    do 
        printf '\t\e[3;3;31mErreur : Saisir un nombre\n\e[3;3;31m\e[0m'
        read -p "Entrer la temperature a convertir " n

    done
    echo
    printf "F - Convertir en degré Fahrenheit\nC - Convertir en degré Celsius\n\n"
    while true
    do
        read -sn 1 cf
        case $cf in 
            [Ff] ) echo "$n""˚F = $(( ($n - 32) * 5 / 9 ))˚C"; break;;
            [cC] ) echo "$n""˚C = $(( $n * 9 / 5 + 32 ))˚F"; break;;
            * ) printf '\e[3;3;31mSelection Invalide Recommencer\n\e[3;3;31m\e[0m'
            printf 'F - Convertir en degré Fahrenheit\nC - Convertir en degré Celsius\n\n'
        esac
    done
    echo
    while true
    do
        printf "1 - Convertir une nouvelle temperature\n2 - Quitter"
        read -sn1 bye ; printf "\n\n"
        case $bye in
            [1] ) 
            break
            ;;
            [2] ) printf "Au revoir !\n\n" && exit
            ;;
            * ) 
            printf '\t\e[3;3;31mSelection Invalide Recommencer\n\e[3;3;31m\e[0m'
            ;;
        esac
    done
done