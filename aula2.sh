#!/bin/bash

backtitle_="Caixa de informacao"

# \ é usado para quebrar a tela
# armazene na variável o resultado da box
nome=$(
    dialog --stdout --title "Nome" \
    --backtitle "$backtitle_" \
    --inputbox "Qual seu nome?" 0 0
)

dialog --title "Seu nome" --backtitle "$backtitle_" --sleep 3 --infobox "$nome" 0 0

senha=$(
    dialog --stdout --title "Senha" --backtitle "$backtitle_" --insecure --passwordbox "Qual a sua senha?" 0 0
)

dialog --title "Sua senha" --backtitle "$backtitle_" --sleep 3 --infobox "Sua senha: $senha" 0 0 