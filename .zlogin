#!/bin/zsh

# startup
if [[ -n "$DISPLAY" ]]; then
  date "+%Y%m%d %H:%M:%S"
  # xmousebtn
  if [[ `uname` == 'Linux' ]]; then
    source $HOME/.xmousebtn
  fi
fi

# xterm
TERM=xterm-256color
XTERM_SHELL=/bin/zsh
XTERM_LOCALE="en_US.UTF-8"
XTERM_VERSION="XTerm(276)"
export TERM XTERM_SHELL_XTERM_LOCALE XTERM_VERSION
