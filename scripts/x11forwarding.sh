#!/bin/bash

# 1. Installation
info "°°° Installation de X11Forwarding °°°"
echo "Installation des dependances..."
sudo apt update
sudo apt install -y openssh-server xauth

# 2. Configuration
echo "Mise à jour de la configuration sshd..."
sudo cp configs/sshd/* "/etc/chrony/conf.d/"

# 3. Redémarrage du service
sudo systemctl restart sshd

success "Installation de X11Forwarding effectuée avec succès"