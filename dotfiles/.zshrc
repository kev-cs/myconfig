# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

SHELL_CONFIG_DIR=~/shell-config

source $SHELL_CONFIG_DIR/oh-my-zsh-config.zsh
source $SHELL_CONFIG_DIR/alias-expansion-config.zsh
source $SHELL_CONFIG_DIR/git-aliases.sh
source $SHELL_CONFIG_DIR/aliases.sh

alias -s {zip,ZIP,jar,JAR,war,WAR}="unzip -l"

export PATH=${PATH}:~/Data/bin


