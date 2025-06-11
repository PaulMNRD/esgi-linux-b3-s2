#!/bin/bash
set -e

source "scripts-client/utils.sh"

step "Configuration du client NTP (Chrony)"
execute_script "scripts-client/chrony_client.sh"

step "Configuration de Postfix client"
execute_script "scripts-client/postfix_client.sh"

step "Configuration du fuseau horaire"
execute_script "scripts-client/timezone_client.sh"

step "Tests PAM côté client"
execute_script "scripts-client/test_pam_client.sh"

step "Configuration client terminée"
