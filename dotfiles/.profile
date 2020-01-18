if [[ -f ~/.myprofile ]]; then
  source ~/.myprofile;
else
  echo "No ~/.myprofile defined"
fi

export EDITOR=vim
export HISTCONTROL=ignorespace
