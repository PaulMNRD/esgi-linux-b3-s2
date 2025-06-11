#!/bin/bash

info "°°° Installation de Postfix et mailutils °°°"
debconf-set-selections <<< "postfix postfix/mailname string yourdomain.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
apt install -y postfix mailutils libsasl2-modules

success "Installtion de Postfix terminée avec succès"