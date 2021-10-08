#!/usr/bin/env bash

define LAUNCH_CONFIG <<EOF
  {
    "version": "0.2.0",
    "configurations": [
      {
        "name": "$PROJECT",
        "request": "launch",
        "type": "dart",
        "args": [
          "--no-sound-null-safety",
          "--pub"
        ]
      }
    ]
  }
EOF

OUT_DIR="$(pwd)/.vscode/launch.json"
PUBSPEC="$(pwd)/pubspec.yaml"

if [[ -f "$PUBSPEC" ]]; then
  echo "Setting up for Flutter/Dart application..." | status


  if [ ! -f $OUT_DIR ]; then
    echo "Creating initial VSCode launch settings for flutter..." | status
    
    _dir="$(dirname -- "$OUT_DIR")"
    [ -d "$_dir" ] || mkdir -p -- "$_dir"
    touch -- "$OUT_DIR"


    echo "$LAUNCH_CONFIG" >> $OUT_DIR
  fi

fi
