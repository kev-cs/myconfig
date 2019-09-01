#!/usr/bin/env bash

OH_MY_ZSH_DIR=~/.oh-my-zsh

git clone https://github.com/robbyrussell/oh-my-zsh.git $OH_MY_ZSH_DIR
git clone https://github.com/romkatv/powerlevel10k.git $OH_MY_ZSH_DIR/custom/themes/powerlevel10k
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $OH_MY_ZSH_DIR/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions $OH_MY_ZSH_DIR/custom/plugins/zsh-autosuggestions

