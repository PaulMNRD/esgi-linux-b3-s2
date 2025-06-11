#!/bin/bash

info "°°° Installation de Postfix et mailutils °°°"
sudo debconf-set-selections <<< "postfix postfix/mailname string yourdomain.com"
sudo debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"
sudo apt install -y postfix mailutils libsasl2-modules

success "Installtion de Postfix terminée avec succès"