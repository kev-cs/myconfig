alias galiases='alias | grep git'
alias g="git"
alias gconf="git config --show-origin --list"

alias gs="git status"
alias gadog="git log --all --decorate --one-line --graph"
alias gd="git diff"

alias gc="git checkout"
alias gm="git merge"
#https://stackoverflow.com/questions/572549/difference-between-git-add-a-and-git-add
alias gaa="git add --all"

alias gcm="git commit -v -m"
alias gcma="gaa && git commit -v -m"
alias 'gcm!'="git commit --amend --no-edit"
alias 'gcma!'="gaa && git commit --amend --no-edit"
gcmp(){
	git commit -v -m "$1" && git push;
}
gcmap(){
	git add --all && git commit -v -m "$1" && git push;
}
alias gp="git pull -r && git status"
alias gf="git fetch"
alias gpush="git push && git status"
alias gpsup="git push --set-upstream origin \$(git_current_branch)"

gdeleteremote() {
	branch_name=$(git symbolic-ref -q HEAD)
	branch_name=${branch_name##refs/heads/}
	git push -d origin $branch_name
}
gcmap_amend(){
	gdeleteremote && git add --all && git commit --amend --no-edit "$1" && git push;
}
alias 'gcmap!'="gcmap_amend"

alias gstash="gaa && git stash"
alias gstash-apply="git stash apply"

alias gclean="git clean -fd"
alias gfetch="git fetch"
alias gfa="git fetch --all --prune"
alias grh="git reset --hard && git status"
alias grh-origin="git reset --hard origin/"

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
