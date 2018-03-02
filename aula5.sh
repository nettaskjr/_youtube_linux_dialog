#!/bin/bash

op=$(
    dialog \
    --stdout \
    --cancel-label "Cancelar" \
    --radiolist "Escolha algo?" \
    0 0 0 \
    "Editor"    "Edite seus textos" on \
    "Internet"  "Use a internet"    off \
    "Chat"      "Fale com amigos"   off\
)

echo $op