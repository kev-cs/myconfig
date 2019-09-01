export ZSH=~/.oh-my-zsh

ZSH_THEME="powerlevel10k/powerlevel10k"
COMPLETION_WAITING_DOTS="true"

plugins=(
colored-man-pages
docker
docker-compose
zsh-syntax-highlighting
zsh-autosuggestions
wd
)

source $ZSH/oh-my-zsh.sh
source ~/.p10k.zsh

