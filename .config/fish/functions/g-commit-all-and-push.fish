# Defined in ./git-functions.fish @ line 6
function g-commit-all-and-push --description 'Add all modified files to staging, create commit and push'
	git add -A && git commit -m $argv[1] && git push;
end
