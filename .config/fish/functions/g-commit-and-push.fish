# Defined in ./git-functions.fish @ line 3
function g-commit-and-push --description 'Create commit and push'
	git commit -m $argv[1] && git push;
end
