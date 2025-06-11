#!/bin/bash
set -e

debconf-set-selections <<< "postfix postfix/mailname string client.domain.com"
debconf-set-selections <<< "postfix postfix/main_mailer_type string 'Internet Site'"

apt install -y -qq postfix mailutils

cp configs-client/main.cf /etc/postfix/main.cf

systemctl restart postfix
