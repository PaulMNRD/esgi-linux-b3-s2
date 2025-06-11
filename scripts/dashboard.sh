# 1. Installation
echo "Installation des dépendances nécessaires..."
sudo apt install -y python3.11-venv python3-pip python3-tk python3-psutil python3-pytz

echo "Installation du dashboard"
sudo cp -r dashboard /usr/local/lib/dashboard/
sudo cp dashboard/dashboard.sh /usr/local/bin/dashboard
sudo chmod +x /usr/local/bin/dashboard

success "Installation de X11Forwarding effectuée avec succès..."