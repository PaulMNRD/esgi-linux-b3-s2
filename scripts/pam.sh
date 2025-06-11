#!/bin/bash
cp configs/time.conf /etc/security/time.conf

cp configs/common-auth /etc/pam.d/common-auth

apt install -y libpam-pwquality

cp configs/common-password /etc/pam.d/common-password

# expiration des mots de passe
chage --maxdays 90 --mindays 7 --warndays 14 root
