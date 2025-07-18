#!/bin/bash

info "°°° Configuration de PAM °°°"
echo "Installation des dependances..."
sudo apt install -y libpam-pwquality libpam-modules libpam-modules-bin libpam-runtime

echo "Configuration des politiques de sécurité..."
# disponibilité du login
sudo cp configs/pam/time.conf /etc/security/time.conf

# politique de login
sudo cp configs/pam/common-auth /etc/pam.d/common-auth

# politique des mots de passe
sudo cp configs/pam/common-password /etc/pam.d/common-password

# expiration des mots de passe
sudo cp configs/pam/login.defs /etc/login.defs

success "Configuration de PAM terminée avec succès"