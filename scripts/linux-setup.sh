#!/usr/bin/env bash
# Steps :
# 1. update pacman database
# 2. install packages
# 3. install oh-my-zsh & plugins
# 4. create symlinks
# 5. upgrade out-of-date packages

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PACKAGES_FILE="$BASEDIR/../packages/packages.txt"

printf "Enter your password\n"
read -s PASSWORD

sudo -S pacman -Sy --noconfirm <<< "$PASSWORD"
sudo -S pacman -q -S --needed --noconfirm - <<< "$PASSWORD" < $PACKAGES_FILE
./install-oh-my-zsh.sh
sudo -S chsh -s $(which zsh) "$USER" <<< "$PASSWORD"
./create-symlinks.sh
sudo -S pacman -Su --noconfirm <<< "$PASSWORD"
