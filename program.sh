#!/bin/bash

# Variáveis
user="devil"
pass="123"
program="Devil ENTERPRISE v1.0"

# Funções
status() {
    case $? in
        # ESC
        1) exit 1 ;;
        255) 
            #não como default
            dialog \
            --defaultno \
            --yes-label "Sim" --no-label "Nao" \
            --yesno "Deseja sair?" \
            0 0
            [ $? -eq 0 ] && exit 0 ;;
    esac
}

dialog \
--sleep 2 \
--infobox "\n$program" \
5 28

dialog \
--backtitle "$program" \
--yes-label "Sim" --no-label "Nao" \
--yesno "Deseja se logar?" \
0 0

# chamada da função
status

i=0
while (( $i <3 )); do

    login=$(
        dialog \
        --stdout \
        --title "Tela de Login" \
        --cancel-label "Cancelar" \
        --backtitle "$program" \
        --begin 10 60 \
        --no-shadow \
        --inputbox "Usuario" \
        0 0 \
        --and-widget \
        --begin 20 60 \
        --no-shadow \
        --insecure \
        --passwordbox "Digite sua senha" \
        0 0
    )

    login_user=$(echo $login | cut -d ' ' -f1)
    login_pass=$(echo $login | cut -d ' ' -f2)

    if [ "$user" = "$login_user" ] && [ "$pass" = "$login_pass" ]; then
        break
    else
        dialog \
        --sleep 2 \
        --infobox "\nUsuario ou senha invalida..." \
        5 0
        let i++
        (( $i == 3 )) && 
            dialog \
            --sleep 2 \
            --infobox "\nTentativas esgotadas" \
            5 0 \
            && exit
    fi

done

while :; do
    op_menu=$(
        dialog \
        --stdout \
        --no-shadow \
        --title "Menu" \
        --cancel-label "Cancelar" \
        --backtitle "$program" \
        --menu "Bem vindo" \
        0 0 0 \
        "Internet"  "Acessar Internet" \
        "Editor"    "Editor de textos"
    )

    status
    case $op_menu in
        Internet)   google-chrome-stable >/dev/null 2>/dev/null & ;;
        Editor)     gedit >/dev/null 2>/dev/null & ;;
    esac

done