source ~/.myprofile;

if [[ -v MYBIN ]]; then
  export PATH=${PATH}:${MYBIN}
else
  echo "\$MYBIN is not defined"
fi

export EDITOR=vim
export HISTCONTROL=ignorespace
