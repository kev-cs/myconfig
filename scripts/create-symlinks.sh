#!/usr/bin/env bash

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/.."
DOT_FILES=$(find "$BASEDIR/home-dotfiles/" -name "\.*" -type f)
CONFIG_FILES=$(find "$BASEDIR/.config/" -maxdepth 1)

echo "> Creating symlinks for dotfiles"
for file in $DOT_FILES; do
  ln -s -f "$file" ~/"$(basename "$file")"
done

echo "> Creating symlinks for config files"
mkdir -p ~/.config
for file in $CONFIG_FILES; do
  ln -s -f "$file" ~/.config/"$(basename "$file")"
done

echo "> Symlinking shell-config"
ln -s -f "$BASEDIR/shell-config" ~/shell-config

echo "> Done creating symlinks ($SCRIPTNAME)"