#!/bin/bash
set -e

# Tentative de connexion en dehors de la plage horaire → test manuel
echo "===> Test PAM : tenter une connexion SSH en dehors de la plage horaire autorisée."

# Changement de mot de passe pour déclencher l'alerte mail (test)
echo "===> Test PAM : changement de mot de passe (passwd)."

passwd $USER
