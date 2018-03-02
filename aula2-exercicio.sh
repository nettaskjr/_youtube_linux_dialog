#!/bin/bash

title_="Login"
backtitle_="Tela de Login"

nome=$(
    dialog \
    --stdout \
    --title "$title_" \
    --backtitle "$backtitle_" \
    --inputbox "Informe Nome?" \
    0 0
)

senha=$(
    dialog \
    --stdout \
    --title "$title_" \
    --backtitle "$backtitle_" \
    --insecure \
    --passwordbox "Informe Senha?" \
    0 0
)

dialog \
--title "$title_" \
--backtitle "$backtitle_" \
--infobox "Nome: $nome Senha: $senha" \
5 50