#!/bin/zsh

# startup
if [[ -n "$DISPLAY" ]]; then
  date "+%Y%m%d %H:%M:%S"
  # Xmousebtn
  if [[ `uname` == 'Linux' ]]; then
    source $HOME/.xmousebtn
  fi
fi

# stty
# disable stop by `C-s`
stty stop undef

# xterm
TERM=xterm-256color
XTERM_SHELL=/bin/zsh
XTERM_LOCALE="en_US.UTF-8"
XTERM_VERSION="XTerm(276)"
export TERM XTERM_SHELL_XTERM_LOCALE XTERM_VERSION
