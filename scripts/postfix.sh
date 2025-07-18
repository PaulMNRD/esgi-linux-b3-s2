#!/bin/bash

info "°°° Installation de Postfix et mailutils °°°"
# === CONFIGURATION À MODIFIER ===
GMAIL_USER="frin.arcoss@gmail.com"
GMAIL_PASS="qwkvhuaglsqoxxwr"
GMAIL_TEST="pmenard3@myges.fr"

# === INSTALLATION ===
echo "Installation des dépendances..."
apt update
DEBIAN_FRONTEND=noninteractive apt install -y postfix mailutils libsasl2-modules

# === CONFIG MAIN.CF ===
echo "Configuration de Postfix pour Gmail..."

POSTFIX_CONF="/etc/postfix/main.cf"

postconf -e "relayhost = [smtp.gmail.com]:587"
postconf -e "smtp_use_tls = yes"
postconf -e "smtp_sasl_auth_enable = yes"
postconf -e "smtp_sasl_password_maps = hash:/etc/postfix/sasl_passwd"
postconf -e "smtp_sasl_security_options = noanonymous"
postconf -e "smtp_tls_CAfile = /etc/ssl/certs/ca-certificates.crt"

# === CONFIG AUTH ===
echo "[smtp.gmail.com]:587 $GMAIL_USER:$GMAIL_PASS" > /etc/postfix/sasl_passwd

postmap /etc/postfix/sasl_passwd
chown root:root /etc/postfix/sasl_passwd*
chmod 600 /etc/postfix/sasl_passwd*

# === RESTART POSTFIX ===
echo "Redémarrage du service Postfix..."
systemctl restart postfix

# === TEST OPTIONNEL ===
echo "Test : envoi d'un mail à $GMAIL_TEST"
echo "Test automatique depuis Postfix/Gmail sur Debian." | mail -s "Test Postfix OK" "$GMAIL_TEST"

echo "Configuration terminée."

success "Installtion de Postfix terminée avec succès"