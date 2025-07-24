#!/bin/bash

info "°°° Configuration de PAM °°°"
echo "Installation des dependances..."
sudo apt install -y libpam-pwquality libpam-modules libpam-modules-bin libpam-runtime

echo "Configuration des politiques de sécurité..."

# configuration pam
sudo cp configs/pam/{common-auth,common-password,login} /etc/pam.d/

# expiration des mots de passe
sudo cp configs/pam/login.defs /etc/login.defs

# disponibilité du login
sudo cp configs/pam/time.conf /etc/security/time.conf

success "Configuration de PAM terminée avec succès"