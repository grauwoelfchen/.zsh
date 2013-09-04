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
PATH=/usr/local/sbin:/usr/local/bin:$PATH
PATH=/sbin:/usr/sbin:$PATH
export PATH
# devel
PATH=$HOME/.work/dev/bin:$PATH
export PATH
# }}}

# rbenv {{{
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
# }}}

# python {{{
export PYTHONSTARTUP=$HOME/.pythonstartup
# virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.3
#export VIRTUALENV_USE_DISTRIBUTE=true
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/virtualenvs
  source /usr/bin/virtualenvwrapper.sh
fi
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}
