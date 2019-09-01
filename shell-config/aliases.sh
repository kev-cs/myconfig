alias v=vim
alias grep='grep --color=auto'
alias install-packages-from-file='sudo pacman -S --needed - < '
alias backup-native-packages='pacman -Qqen > native-packages.txt'
alias backup-foreign-packages='pacman -Qqem > foreign-packages.txt'
alias backup-modified-config-files="pacman -Qii | awk '/^MODIFIED/ {print \$2}' | tar -n -T - -cvzf modified_cfg_files.tz"

if type "exa" > /dev/null; then
  alias l=' exa -lah'
else
  alias l=" ls -lah"
fi

if type "ialias" > /dev/null; then
  ialias l > /dev/null
  ialias grep > /dev/null
fi

# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}

