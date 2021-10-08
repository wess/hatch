#!/usr/bin/env bash

CUR_DIR="$(pwd)"

export AUTHOR_EMAIL=$(cat ${HOME}/.gitconfig | grep -i -o '[a-zA-Z0-9._%+-]\+@[a-zA-Z0-9.-]\+\.[a-zA-Z]\{2,4\}')
export AUTHOR="${USER}"
export COMPANY="$AUTHOR"

echo "$AUTHOR_EMAIL" | success

echo "Setting up $PROJECT project..." | status

echo "Initializing git..." | status
git init $CUR_DIR

echo "Adding gitignore..." | status
source ${SCRIPT_LIBS_DIR}/__gitignore.sh

echo "Setting up VSCode..." | status
source ${SCRIPT_LIBS_DIR}/__vscode_settings.sh

echo "Setting up direnv .envrc..." | status
source ${SCRIPT_LIBS_DIR}/__envrc.sh
source ${SCRIPT_LIBS_DIR}/__project_detect.sh


### Clean up
unset CUR_DIR
unset AUTHOR_EMAIL
unset AUTHOR
unset COMPANY

echo "*** Reminder: run 'direnv allow' to complete." | warning
sleep 2
echo "$PROJECT setup complete." | success