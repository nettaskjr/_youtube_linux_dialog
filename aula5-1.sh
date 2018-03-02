#!/bin/bash

op=$(
    dialog \
    --stdout \
    --separate-output \
    --help-button --help-label "Ajuda" \
    --cancel-label "Cancelar" \
    --checklist "Escolha algo" \
    0 0 0 \
    "Editor"    "Edite seus textos" on \
    "Internet"  "Use a internet"    off \
    "Chat"      "Fale com amigos"   off\
)

[ $? -eq 2 ] && dialog --msgbox "Ajuda" 0 0

echo "$op" | while read opcao; do
    case $opcao in
        # & :: para rodar em segundo plano
        Editor)     gedit & ;;
        Internet)   google-chrome-stable & ;;
        Chat)       echo "Chat" 
    esac
done