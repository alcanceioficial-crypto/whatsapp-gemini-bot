#!/usr/bin/env bash
# exit on error
set -o errexit

STORAGE_DIR=/opt/render/project/src/chrome
CHROME_DIR="$STORAGE_DIR/opt/google/chrome"

if [[ ! -d "$CHROME_DIR" ]]; then
  echo "...Baixando Chrome"
  mkdir -p "$STORAGE_DIR"
  cd "$STORAGE_DIR"
  wget -P ./ https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
  dpkg -x ./google-chrome-stable_current_amd64.deb .
  rm ./google-chrome-stable_current_amd64.deb
  cd /opt/render/project/src
else
  echo "...Usando Chrome do cache"
fi

# Instala as dependências do Node
npm install
