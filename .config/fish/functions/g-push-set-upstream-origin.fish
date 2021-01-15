# Defined in ./git-functions.fish @ line 12
function g-push-set-upstream-origin --description 'Automatically set upstream origin with current branch name'
  git push --set-upstream origin (git_branch_name)
end
