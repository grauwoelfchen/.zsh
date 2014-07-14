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
# atelier
export PATH=$HOME/.atelier/bin:$PATH
# }}}

# editor {{{
VIM=/usr/bin/vim
export EDITOR=$VIM GIT_EDITOR=$VIM SVN_EDITOR=$VIM
# }}}

# git {{{
export GIT_MERGE_VERBOSITY=4
# }}}

# lisp {{{
export PATH=$HOME/.shelly/bin:$PATH
# }}}

# rbenv {{{
export RBENV_ROOT=/usr/local/share/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
# }}}

# python {{{
export PYTHONSTARTUP=$HOME/.pythonstartup
# virtualenv
VIRTUALENV_BIN_ROOT=/usr
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
if [ -f $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/share/virtualenvs
  export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
  source $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh
fi
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}
