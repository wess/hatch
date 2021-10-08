#!/usr/bin/env bash

define ENV_RC <<EOF
######
## When values in here are changed
## Rerun 'direnv allow'
######

#### GENERAGED BY HATCH
PATH_add $SCRIPT_ROOT

PROJECT_LAYOUT


#### APP SPECIFICS

EOF

OUT_DIR="$(pwd)/.envrc"

if [ ! -f $OUT_DIR ]; then
  mkdir -p "$(dirname "$OUT_DIR")" && touch "$OUT_DIR"
  echo "$ENV_RC" >> $OUT_DIR
fi


unset ENV_RC
unset OUT_DIR