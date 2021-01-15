alias g="git"
alias gconf="git config --show-origin --list"

alias gs="git status"
alias gadog="git log --all --decorate --one-line --graph"
alias gd="git diff"

alias gc="git checkout"
alias gm="git merge"
alias gaa="git add -A"
alias gcm="git commit -v -m"
alias grh="git reset --hard && git status"

alias gf="git fetch"
alias gp="git pull -r && git status"
alias gpush="git push && git status"
alias gpsup="g-push-set-upstream-origin"

alias gcma="git add -A && git commit -m"
alias 'gcm!'="git commit --amend --no-edit"
alias 'gcma!'="git add -A && git commit --amend --no-edit"
alias gcmp="g-commit-and-push"
alias gcmap="g-commit-all-and-push"

alias gstash="git add -A && git stash"
alias gstash-apply="git stash apply"

alias gclean="git clean -fd"
alias gfa="git fetch --all --prune"
alias gwch="git whatchanged -p --abbrev-commit --pretty=medium"
