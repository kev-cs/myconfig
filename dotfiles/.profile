if [[ -f ~/.myprofile ]]; then
  source ~/.myprofile;
else
  echo "~/.myprofile is not defined (for locally dependent settings)"
fi

if [[ -v MYBIN ]]; then
  export PATH=${PATH}:~/Data/bin
else
  echo "\$MYBIN is not defined"
fi

export EDITOR=vim
export HISTCONTROL=ignorespace
