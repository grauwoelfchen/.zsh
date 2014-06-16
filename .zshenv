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
# }}}

# editor {{{
VIM=/usr/bin/vim
export EDITOR=$VIM GIT_EDITOR=$VIM SVN_EDITOR=$VIM
# }}}

# git {{{
GIT_MERGE_VERBOSITY=4
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
VIRTUALENV_BIN_ROOT=/usr
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
if [ -f $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/virtualenvs
  export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
  source $VIRTUALENV_BIN_ROOT/bin/virtualenvwrapper.sh
fi
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}

# darwin {{{
if [[ `uname` == 'Darwin' ]]; then
  source $HOME/.zsh/.zshenv.darwin
fi
# }}}
