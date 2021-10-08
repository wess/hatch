#!/usr/bin/env bash

PROJECT_FILE="$(pwd)/package.json"
ENV_FILE="$(pwd)/.envrc"
DIR_ENV=$(cat "$ENV_FILE")
LAYOUT="layout node"

if [[ -f "$PROJECT_FILE" ]]; then
  echo "Adding Node to envrc..." | status

  rm -rf "$ENV_FILE"
  mkdir -p "$(dirname "$ENV_FILE")" && touch "$ENV_FILE"
  echo "${DIR_ENV/PROJECT_LAYOUT/$LAYOUT}" >> $ENV_FILE
fi

unset PROJECT_FILE
unset ENV_FILE
unset DIR_ENV
unset LAYOUT