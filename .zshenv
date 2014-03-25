#!/bin/zsh

# .zsh {{{
export ZDOTDIR=$HOME/.zsh
fpath=(
$ZDOTDIR
${ZDOTDIR}/bundle/zsh-git-escape-magic
${ZDOTDIR}/bundle/zsh-syntax-highlighting
$fpath
)
# }}}

# path {{{
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
export PATH=/sbin:/usr/sbin:$PATH
# devel
export PATH=$HOME/.work/dev/bin:$PATH
if [[ `uname` == 'Darwin' ]]; then
  # MacPorts
  export PATH="/opt/local/sbin:/opt/local/bin:$PATH"
  # GNU
  export PATH="/opt/local/libexec/gnubin/:$PATH"
fi
# }}}

# editor {{{
VIM=/usr/bin/vim
if [[ `uname` == 'Darwin' ]]; then
  VIM=/opt/local/bin/vim
fi
export EDITOR=$VIM GIT_EDITOR=$VIM SVN_EDITOR=$VIM
# }}}

# lisp {{{
export PATH=$HOME/.shelly/bin:$PATH
# }}}

# rbenv {{{
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
# }}}

# python {{{
export PYTHONSTARTUP=$HOME/.pythonstartup
# virtualenv
if [[ `uname` -ne 'Linux' ]]; then
  VIRTUALENV_BIN_ROOT=/usr/local
else
  VIRTUALENV_BIN_ROOT=/usr
fi
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
#export VIRTUALENV_USE_DISTRIBUTE=true
if [ -f $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/virtualenvs
  export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
  source $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh
fi
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}
