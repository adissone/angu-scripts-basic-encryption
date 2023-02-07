#!/usr/bin/env bash

P_DIRNAME=angubs

P_SCRIPT=$(realpath "$0")
P_CDIR=$(dirname "$P_SCRIPT")

P_INPUT_FILE=${P_CDIR}/${P_DIRNAME}.zip
P_OUTPUT_DIR="${HOME}/${P_DIRNAME}"


mkdir -p "${P_OUTPUT_DIR}"
${P_CDIR}/angu-bs-unpack.sh "${P_INPUT_FILE}" "${P_OUTPUT_DIR}"


