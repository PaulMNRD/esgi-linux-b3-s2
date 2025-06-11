#!/bin/bash

step() {
    echo -e "\n[STEP] $1\n"
}

execute_script() {
    local script="$1"
    if [[ -f "$script" ]]; then
        bash "$script"
    else
        echo "[ERROR] Le script $script est introuvable"
        exit 1
    fi
}
