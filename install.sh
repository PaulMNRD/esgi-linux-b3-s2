#!/bin/bash
source "scripts/utils.sh"

info "=== Debut de la configuration ==="

execute "chrony"

execute "locales"

execute "pam"

execute "postfix"

execute "x11forwarding"

execute "dashboard"

info "=== Fin de la configuration ==="