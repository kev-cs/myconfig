function bind_expand_all
    set -l expanded
    for token in (commandline --tokenize)
        set expanded $expanded (eval echo $token)
    end
    set -l new (string join " " $expanded)
    commandline -r $new
    commandline -C (string length $new)
end

function fish_user_key_bindings
    bind \e\[1\;5B 'history-token-search-forward'
    bind \e\[1\;5A 'history-token-search-backward'
    bind \e\[1\;5D 'prevd-or-backward-word'
    bind \e\[1\;5C 'nextd-or-forward-word'
    bind \e\[1\;5C 'nextd-or-forward-word'
    bind \e\ce bind_expand_all
end


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
eval $HOME/data/miniconda3/bin/conda "shell.fish" "hook" $argv | source
# <<< conda initialize <<<

