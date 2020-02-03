function sourceFileIfExists() {
  if [[ -f $1 ]]; then
    source $1
  else
    echo "$1 is not defined"
  fi
}

sourceFileIfExists ~/.myprofile;

if [[ -v MYBIN ]]; then
  export PATH=${PATH}:${MYBIN}
else
  echo "\$MYBIN is not defined"
fi

export EDITOR=vim
export HISTCONTROL=ignorespace
