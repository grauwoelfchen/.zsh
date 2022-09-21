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
export PATH=/usr/sbin:/usr/bin:/sbin:/bin
export PATH=/usr/local/sbin:/usr/local/bin:$PATH
# gentoo prefix
# export EPREFIX=/opt/gentoo
# export PATH=$EPREFIX/sbin:$EPREFIX/bin:$PATH
# export PATH=$EPREFIX/usr/sbin:$EPREFIX/usr/bin:$PATH
# export PATH=$EPREFIX/usr/local/sbin:$EPREFIX/usr/local/bin:$PATH
# atelier
export PATH=$HOME/.atelier/bin:$PATH
# }}}

# editor {{{
VIM=/usr/bin/vim
export EDITOR=$VIM GIT_EDITOR=$VIM SVN_EDITOR=$VIM
# }}}

# browser {{{
export WGETRC=$HOME/.wgetrc
export WWW_HOME="file:///opt/local/.startup/index.html"
# }}}

# git {{{
export GIT_MERGE_VERBOSITY=4
# }}}

# rust {{{
export PATH="$HOME/.cargo/bin:$PATH"
if command -v rustc 1>/dev/null 2>&1; then
  export RUST_SRC_PATH="$(rustc --print sysroot)/lib/rustlib/src/rust/src"
fi
# }}}

# erlang {{{
export PATH=$HOME/.erln8.d/bin:$PATH
# }}}

# lisp {{{
export PATH=$HOME/.shelly/bin:$PATH
# }}}

# haskell {{{
## cabal
export PATH=$HOME/.cabal/bin:$PATH
## stack
export PATH=$HOME/.local/bin:$PATH
# }}}

# nodenv {{{
export NODENV_ROOT=/usr/local/share/nodenv
export PATH=$NODENV_ROOT/bin:$PATH
if command -v nodenv 1>/dev/null 2>&1; then
  eval "$(nodenv init -)"
fi
# }}}

# ruby {{{
## rbenv
export RBENV_ROOT=/usr/local/share/rbenv
export PATH=$RBENV_ROOT/bin:$PATH
if command -v rbenv 1>/dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
# }}}

# php {{{
## phpenv
export PHPENV_ROOT=/usr/local/share/phpenv
export PATH=$PHPENV_ROOT/bin:$PATH
if command -v phpenv 1>/dev/null 2>&1; then
  eval "$(phpenv init -)"
fi
# }}}

# python {{{
export PYTHONSTARTUP=$HOME/.pythonstartup
## virtualenv
export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/share/virtualenvs
  export VIRTUALENVWRAPPER_HOOK_DIR=$WORKON_HOME
  export VIRTUALENVWRAPPER_LOG_DIR=$WORKON_HOME
  source /usr/bin/virtualenvwrapper_lazy.sh
fi
## pyenv
export PYENV_ROOT=/usr/local/share/pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if command -v pyenv 1>/dev/null 2>&1; then
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi
# }}}

# go {{{
export GOARCH=amd64
export GOOS=linux
# gvm
[[ -s "$HOME/.gvm/scripts/gvm" ]] && source "$HOME/.gvm/scripts/gvm"
# system
if [ "/usr/bin/go" = "$(which go)" ]; then
  export GOROOT=/usr/lib/go
  export GOPATH=$HOME/.go
  export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
fi
# }}}

# java {{{
GRADLE_PATH="$HOME/.gradle/wrapper/dists/gradle-4.6-all"
GRADLE_PATH="$GRADLE_PATH/bcst21l2brirad8k2ben1letg/gradle-4.6"
export GRADLE_PATH=$GRADLE_PATH
# }}}

# anyenv {{{
export PATH=$HOME/.anyenv/bin:$PATH
if command -v anyenv 1>/dev/null 2>&1; then
  eval "$(anyenv init -)"
fi
# }}}

# dotnet {{{
export DOTNET_CLI_TELEMETRY_OPTOUT=true
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}
