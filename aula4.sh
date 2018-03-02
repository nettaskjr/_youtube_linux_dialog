#!/bin/bash

dialog --msgbox "Tudo bem com vc?" 5 20

# mudando o texto do botão
dialog --ok-label "  Execute  " --msgbox "Tudo bem com vc?" 5 20

# menu
# o terceiro info deste comando informa a quanditade de itens mostrados,
# dai tem que rolar para ver os demais, sugestão deixar em 0 pois se auto ajusta
# laço que so deixa sair se clicar em cancel $? = 1
while true; do
    op=$(
    dialog  --stdout  --title "Menu" --backtitle "Menu de teste" \
            --ok-label "  Execute  " --cancel-label "  Cancelar  " \
            --menu "O que voce deseja fazer?" \
            0 0 0 \
            "Internet" "Usar internet" \
            "Ler"      "Ler um texto" \
            "Mensagem" "Mensagem de um dia"
    )

    [ $? - eq 1 ] && break
    # deixa o texto em minusculo
    op=${op,,}

    case $op in 
        # exexcuta o chrome sem mostrar os erros, redirecionando as saidas de erro e colocando em segundo plano
        internet) google-chrome-stable >&- 2>&- & ;;
        ler) gedit >&- 2>&- & ;;
        mensagem) 
            # timeout sai por tempo, utiliza saida 255
            dialog --timeout 2 --msgbox "Sou um genio" 5 0;;
    esac
done