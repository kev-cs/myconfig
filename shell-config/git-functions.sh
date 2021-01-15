g-commit-and-push(){
	git commit -m "$1" && git push;
}
g-commit-all-and-push(){
	git add -A && git commit -m "$1" && git push;
}
g-delete-remote-branch() {
	branch_name=$(git symbolic-ref -q HEAD)
	branch_name=${branch_name##refs/heads/}
	git push -d origin $branch_name
}
g-push-set-upstream-origin(){
  git push --set-upstream origin $(git_current_branch)
}
