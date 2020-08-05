alias v=vim
alias grep='grep --color=auto'

if type "exa" > /dev/null; then
  alias l=' exa -lah'
else
  alias l=" ls -lah"
fi

if type "ialias" > /dev/null; then
  ialias l > /dev/null
  ialias grep > /dev/null
  ialias z > /dev/null
fi

# starts one or multiple args as programs in background
background() {
  for ((i=2;i<=$#;i++)); do
    ${@[1]} ${@[$i]} &> /dev/null &
  done
}

