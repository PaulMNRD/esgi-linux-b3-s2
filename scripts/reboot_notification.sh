#!/bin/bash

# Script pour envoyer un email lors du redémarrage

HOSTNAME=$(hostname)
DATE=$(date '+%Y-%m-%d %H:%M:%S')
EMAIL_RECIPIENT="frin.arthur@gmail.com"

# Attendre que le réseau soit disponible
sleep 30

# Log l'événement
logger "System reboot notification triggered on $HOSTNAME at $DATE"

# Envoyer l'email
EMAIL_SUBJECT="[SYSTEM] Redémarrage du serveur - $HOSTNAME"
EMAIL_BODY="Le serveur $HOSTNAME a redémarré:
- Date: $DATE
- Serveur: $HOSTNAME"

echo "$EMAIL_BODY" | mail -s "$EMAIL_SUBJECT" "$EMAIL_RECIPIENT"

logger "System reboot notification email sent"