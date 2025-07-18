#!/bin/bash
set -e

# 1. Installation
echo "Installation des dependances..."
sudo apt update
sudo apt install -y chrony

# 2. Configuration
echo "Mise à jour de la configuration de chrony..."
sudo cp "configs-client/chrony.conf" "/etc/chrony/conf.d/"

# 3. Activation du service
echo "Activation de chrony..."
sudo systemctl restart chrony
sudo systemctl enable chrony 2>/dev/null

echo "Configuration NTP terminée avec succès"