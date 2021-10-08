#!/usr/bin/env bash

CUR_DIR="$(pwd)"

if [[ -z "$HATCH_DIR" ]]; then
  export HATCH_DIR="${SCRIPT_ROOT}"
fi

### CLEAN UP
unset CUR_DIR