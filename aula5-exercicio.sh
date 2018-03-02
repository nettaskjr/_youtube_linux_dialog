#!/bin/bash

op=$(
    dialog \
    --stdout \
    --separate-output \
    --help-button --help-label "Ajuda" \
    --cancel-label "Cancelar" \
    --checklist "Quais o programas favoritos?" \
    0 0 0 \
    "gedit"                 "Editor de texto"   off \
    "google-chrome-stable"  "Navegador"         off \
    "firefox"               "Edigor de texto 2" off \
)

[ $? -eq 2 ] && dialog --msgbox "Ajuda" 0 0

# & :: para rodar em segundo plano

echo "$op" | while read opcao; do
    case $opcao in
        gedit)                  gedit & ;;
        google-chrome-stable)   google-chrome-stable & ;;
        firefox)                firefox & ;;
    esac
done