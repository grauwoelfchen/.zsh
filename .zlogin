#!/bin/zsh

# startup (use if for scp)
if [[ -n "$DISPLAY" ]]; then
  date "+%Y%m%d %H:%M:%S"
fi

# xmousebtn
if [[ `uname` == 'Linux' ]]; then
  source $HOME/.xmousebtn
fi

# xterm
TERM=xterm-256color
XTERM_SHELL=/bin/zsh
XTERM_LOCALE="en_US.UTF-8"
XTERM_VERSION="XTerm(276)"
export TERM XTERM_SHELL_XTERM_LOCALE XTERM_VERSION
