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
zsh-nvm
)

source $ZSH/oh-my-zsh.sh
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
