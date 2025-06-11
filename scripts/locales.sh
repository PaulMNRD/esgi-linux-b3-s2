#!/bin/bash

info "°°° Configuration des locales °°°"
echo "Installation des dependances..."
apt install -y locales

echo "Configuration des locales..."
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i es_ES -f UTF-8 es_ES.UTF-8
localedef -i it_IT -f UTF-8 it_IT.UTF-8
timedatectl set-timezone UTC

success "Configuration des locales terminée avec succès"