#!/usr/bin/env bash

#
# __project_detect.sh
# scripts
# 
# Author: Wess Cope (you@you.you)
# Created: 09/15/2021
# 
# Copywrite (c) 2021 Wess.io
#

source ${SCRIPT_LIBS_DIR}/__flutter.sh
source ${SCRIPT_LIBS_DIR}/__node.sh

ENV_FILE="$(pwd)/.envrc"
DIR_ENV=$(cat "$ENV_FILE")
CLEARED=""

echo "${DIR_ENV/PROJECT_LAYOUT/$CLEARED}" > $ENV_FILE

unset ENV_FILE
unset DIR_ENV
unset CLEARED