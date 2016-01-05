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
export PATH=$PATH:/usr/games/bin
# atelier
export PATH=$HOME/.atelier/bin:$PATH
# }}}

# editor {{{
VIM=/usr/bin/vim
export EDITOR=$VIM GIT_EDITOR=$VIM SVN_EDITOR=$VIM
# }}}

# browser {{{
export WWW_HOME="file:///opt/local/.startup/index.html"
# }}}

# git {{{
export GIT_MERGE_VERBOSITY=4
# }}}

# erlang {{{
export PATH=$HOME/.erln8.d/bin:$PATH
# }}}

# lisp {{{
export PATH=$HOME/.shelly/bin:$PATH
# }}}

# haskell {{{
export PATH=$HOME/.cabal/bin:$PATH
# }}}

# rbenv {{{
export RBENV_ROOT=/usr/local/share/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
# }}}

# python {{{
export PYTHONSTARTUP=$HOME/.pythonstartup
# virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/share/virtualenvs
  export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
  export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
  source /usr/bin/virtualenvwrapper_lazy.sh
fi
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}
