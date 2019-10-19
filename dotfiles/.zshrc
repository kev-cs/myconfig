SHELL_CONFIG_DIR=~/shell-config

source $SHELL_CONFIG_DIR/oh-my-zsh-config.zsh
source $SHELL_CONFIG_DIR/alias-expansion-config.zsh
source $SHELL_CONFIG_DIR/git-aliases.sh
source $SHELL_CONFIG_DIR/aliases.sh

alias -s {zip,ZIP,jar,JAR,war,WAR}="unzip -l"

export PATH=${PATH}:~/Data/bin


