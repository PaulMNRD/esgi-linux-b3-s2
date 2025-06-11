
echo °°° Configuration des locales °°°"
apt install -y locales
localedef -i de_DE -f UTF-8 de_DE.UTF-8
localedef -i es_ES -f UTF-8 es_ES.UTF-8
localedef -i it_IT -f UTF-8 it_IT.UTF-8
timedatectl set-timezone UTC