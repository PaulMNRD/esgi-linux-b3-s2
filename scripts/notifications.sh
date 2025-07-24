#!/bin/bash

info "°°° Configuration des notifications système °°°"

echo "Installation du script de notification de redémarrage..."
sudo cp scripts/reboot_notification.sh /usr/local/bin/reboot_notification.sh
sudo chmod +x /usr/local/bin/reboot_notification.sh

echo "Installation du service systemd pour les notifications..."
sudo cp configs/systemd/reboot-notification.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable reboot-notification.service

success "Configuration des notifications système terminée avec succès"