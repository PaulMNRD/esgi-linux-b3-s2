#!/bin/bash
source "scripts/utils.sh"

info "=== Debut de la configuration ==="

execute "chrony"

execute "x11forwarding"

info "=== Fin de la configuration ==="