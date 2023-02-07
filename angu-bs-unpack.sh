#!/bin/bash

# check gpgtar is installed
P_INPUT="${1}"
P_OUT="${2}"

export GPG_TTY=$(tty)

# validate number or arguments
if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters" >&2
    exit 3
fi

gpg -d "${P_INPUT}" | tar xz -C "${P_OUT}"
P_TIME=$(date +"%Y%m%d_%H%M%S")

if [ -f $HOME/.gitconfig ]; then
    echo "Creating backup at gitconfig at $HOME/.gitconfig_${P_TIME}"
    echo mv $HOME/.gitconfig $HOME/.gitconfig_${P_TIME}
else
    echo cp ${P_OUT}/.gitconfig $HOME/.gitconfig
fi


