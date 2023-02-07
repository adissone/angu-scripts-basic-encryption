#!/usr/bin/env bash


P_DIRNAME=angubs

P_SCRIPT=$(realpath "$0")
P_CDIR=$(dirname "$P_SCRIPT")
P_INPUT_DIR=$HOME/$P_DIRNAME

${P_CDIR}/angu-bs-pack.sh ${P_INPUT_DIR} angubs.zip

