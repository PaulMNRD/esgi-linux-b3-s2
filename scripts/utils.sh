success() {
  echo -e "\033[0;32m$1\033[0m"
}

info() {
  echo -e "\033[0;34m$1\033[0m"
}

error() {
    echo -e "\033[0;31m$1\033[0m"
}

# Execution du script avec arrêt immediat en cas d'erreur
execute() {
    (
        set -e
        source "scripts/$1.sh"
    ) 2> >(while read -r line; do
        error "$line"
    done)
}