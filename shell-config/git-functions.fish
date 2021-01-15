#!/usr/bin/env fish

function g-commit-and-push -d "Create commit and push"
	git commit -m $argv[1] && git push;
end
function g-commit-all-and-push -d "Add all modified files to staging, create commit and push"
	git add -A && git commit -m $argv[1] && git push;
end
function g-delete-remote-branch -d "Delete the current branch on the remote server"
	git push -d origin (git_branch_name)
end
function g-push-set-upstream-origin -d "Automatically set upstream origin with current branch name"
  git push --set-upstream origin (git_branch_name)
end

funcsave g-commit-and-push
funcsave g-commit-all-and-push
funcsave g-delete-remote-branch
funcsave g-push-set-upstream-origin
