# Defined in ./git-functions.fish @ line 9
function g-delete-remote-branch --description 'Delete the current branch on the remote server'
	git push -d origin (git_branch_name)
end
