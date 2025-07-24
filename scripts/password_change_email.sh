#!/bin/bash

# Script pour envoyer un email lors du changement de mot de passe

USERNAME="$PAM_USER"
HOSTNAME=$(hostname)
DATE=$(date '+%Y-%m-%d %H:%M:%S')
EMAIL_RECIPIENT="frin.arthur@gmail.com"

# Log l'événement
logger "Password change detected for user: $USERNAME on $HOSTNAME at $DATE"

# Envoyer l'email
EMAIL_SUBJECT="[SECURITY] Changement de mot de passe - $HOSTNAME"
EMAIL_BODY="Changement de mot de passe détecté:
- Utilisateur: $USERNAME
- Date: $DATE
- Serveur: $HOSTNAME"

echo "$EMAIL_BODY" | mail -s "$EMAIL_SUBJECT" "$EMAIL_RECIPIENT"

exit 0