#!/bin/bash

P_DIR="${1}"
P_OUT="${2}"

if [ ! -d "${P_DIR}" ] 
then
    echo "ERR: Directory to pack "${P_DIR}" does not exists." 
    exit 2 
fi

if [[ $# -ne 2 ]]; then
    echo "Illegal number of parameters" >&2
    exit 3
fi

tar zcf - --directory="${P_DIR}" . | gpg --symmetric > "${P_OUT}" 
echo "Created: ${P_OUT}" 

