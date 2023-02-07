#!/usr/bin/env bash

P_INPUT="${1}"
P_OUT="${2}"

if ! command -v gpg > /dev/null
then
    echo "gpg does not exists"
    exit 1
fi

export GPG_TTY=$(tty)


if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters" >&2
    exit 3
fi

gpg -d "${P_INPUT}" | tar xz -C "${P_OUT}"

P_TIME=$(date +"%Y%m%d_%H%M%S")

if [ -f $HOME/.gitconfig ]; then
    echo "Creating backup at gitconfig at $HOME/.gitconfig_${P_TIME}"
    mv $HOME/.gitconfig $HOME/.gitconfig_${P_TIME}
else
    cp ${P_OUT}/gitconfig/.gitconfig $HOME/.gitconfig
fi

