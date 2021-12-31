#!/usr/bin/env sh
# A simple shell script to bootstrap some personal config files.

SCRIPTNAME=$(basename "$0")
echo "$SCRIPTNAME"

BASEDIR="$(realpath "$(dirname "${BASH_SOURCE[0]}")"/..)"
DOT_FILES=$(find "$BASEDIR/dotfiles/" -name "\.*" -type f)
CONFIG_FILES="$BASEDIR/.config"/*

echo "> Creating symlinks for dotfiles"
for file in $DOT_FILES; do
  ln -sfi "$file" ~/"$(basename "$file")"
done

#echo "> Creating symlinks for config files"
#mkdir -p ~/.config
#for file in $CONFIG_FILES; do
#  echo $file
#  BASENAME="$(basename "$file")"
#
#  if [ -L ~/.config/"$BASENAME" ]; then
#    rm ~/.config/"$BASENAME"
#  elif [ -d ~/.config/"$BASENAME" ]; then
#    mkdir ~/.config/"$BASENAME"_bak
#    mv ~/.config/"$BASENAME"/* ~/.config/"$BASENAME"_bak
#    rmdir ~/.config/"$BASENAME"
#  fi
#
#  ln -sfi "$file" ~/.config/"$BASENAME"
#done

echo "> Symlinking this repo in home folder"
ln -s "$BASEDIR" "$HOME"

echo "> Done"
