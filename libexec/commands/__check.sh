#!/usr/bin/env bash


if [[ -z "$HATCH_DIR" ]]; then
  export HATCH_DIR="${SCRIPT_ROOT}"
fi

if [[ -f "$HATCH_CONFIG" ]]; then
  source "${HATCH_CONFIG}"
else
 source "${SCRIPT_LIBS_DIR}/__config.sh"
fi