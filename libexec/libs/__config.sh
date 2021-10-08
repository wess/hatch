#!/usr/bin/env bash

CUR_DIR="$(pwd)"

DEFAULT_EMAIL=$(cat ${HOME}/.gitconfig | grep -i -o '[a-zA-Z0-9._%+-]\+@[a-zA-Z0-9.-]\+\.[a-zA-Z]\{2,4\}')
DEFAULT_NAME="$USER"
DEFAULT_COMPANY="$USER Incorporated"

if [[ -z "${HATCH_AUTHOR}"]]; then
  read -p "Enter your name [${DEFAULT_NAME}]: " USER_NAME

  if [ -z "$USER_NAME" ]; then
    USER_NAME=${DEFAULT_NAME}
  fi

  export HATCH_AUTHOR="$USER_NAME"
fi

if [[ -z "${HATCH_AUTHOR_EMAIL}"]]; then
  read -p "Enter your email [${DEFAULT_EMAIL}]: " USER_EMAIL

  if [ -z "$USER_EMAIL" ]; then
    USER_EMAIL=${DEFAULT_EMAIL}
  fi

  export HATCH_AUTHOR_EMAIL="$USER_EMAIL"
fi

if [[ -z "${HATCH_COMPANY}"]]; then
  read -p "Enter your company [${DEFAULT_COMPANY}]: " USER_COMPANY

  if [ -z "$USER_COMPANY" ]; then
    USER_COMPANY=${DEFAULT_COMPANY}
  fi

  export HATCH_COMPANY="$USER_COMPANY"
fi

define HATCH_VARS <<EOF
export HATCH_AUTHOR="$USER_NAME"
export HATCH_NAME="$USER"
export HATCH_COMPANY="$USER_COMPANY"
EOF

if [[ ! -f "$HATCH_CONFIG" ]]; then
  mkdir -p "$(dirname "$HATCH_CONFIG")" && touch "$HATCH_CONFIG"
  echo "$HATCH_VARS" > $HATCH_C
fi



### CLEAN UP
unset CUR_DIR
unset DEFAULT_EMAIL
unset DEFAULT_NAME
unset DEFAULT_COMPANY
unset USER_NAME
unset USER_EMAIL
unset USER_COMPANY