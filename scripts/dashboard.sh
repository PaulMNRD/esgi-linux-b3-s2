#!/bin/bash

info "°°° Installation du dashboard °°°"
echo "Installation des dépendances..."
sudo apt install -y python3.11-venv python3-pip python3-tk python3-psutil

echo "Installation du dashboard en tant qu'exécutable..."
sudo cp -r dashboard /usr/local/lib/dashboard/
sudo cp dashboard/dashboard.sh /usr/local/bin/dashboard
sudo chmod +x /usr/local/bin/dashboard

success "Installation du dashboard terminée avec succès"
