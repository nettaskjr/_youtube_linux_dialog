#!/bin/bash

dialog --yesno "Deseja logar?" 0 0

[ $? -eq "0" ]&& \
dialog --infobox "Voce esta logado!" 0 0 || \
dialog --infobox "Voce escolheu sair!" 0 0
