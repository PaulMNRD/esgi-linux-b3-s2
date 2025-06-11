#!/bin/bash

info "°°° Configuration de PAM °°°"
echo "Installation des dependances..."
sudo apt install -y libpam-pwquality

echo "Configuration des politiques de sécurité..."
sudo cp configs/pam/time.conf /etc/security/time.conf

sudo cp configs/pam/common-auth /etc/pam.d/common-auth

sudo cp configs/pam/common-password /etc/pam.d/common-password

# expiration des mots de passe
sudo chage --maxdays 90 --mindays 7 --warndays 14 root

success "Configuration de PAM terminée avec succès"