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

# Installation du script d'email pour changement de mot de passe
echo "Installation du script de notification par email..."
sudo cp scripts/password_change_email.sh /usr/local/bin/password_change_email.sh
sudo chmod +x /usr/local/bin/password_change_email.sh

success "Configuration de PAM terminée avec succès"