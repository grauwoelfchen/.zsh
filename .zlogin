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

# NOTE: let xterm and screen handle $TERM
# xterm (set `XTerm*termName` in ~/.Xresources)
# TERM=xterm-256color
# screen (set `term` in ~/.screenrc)
# TERM=screen-256color-bce

# XTERM_VERSION="XTerm(276)"
XTERM_SHELL=/bin/zsh
XTERM_LOCALE="en_GB.UTF-8"
export TERM XTERM_SHELL_XTERM_LOCALE
