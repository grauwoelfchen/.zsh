#!/bin/zsh

# completion {{{
autoload -U compinit && compinit
# }}}

# alias {{{
source $HOME/.aliasrc
# }}}

# correction {{{
#setopt correctall
# }}}

# cd {{{
setopt autocd
# }}}

# glob {{{
setopt extendedglob
# }}}

# history {{{
setopt hist_ignore_all_dups
setopt hist_ignore_space
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh/.zsh-history"
export SAVEHIST=$HISTSIZE
#}}}

# color {{{
autoload -U colors && colors
# }}}

# prompt {{{
function parse_git_branch {
  git branch --no-color 2>/dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)'
}
export PS1="%{$fg[green]%}[%* - %l]%{$reset_color%} %d %{$fg[yellow]%}%%%{$reset_color%} "
#autoload -U promptinit
#promptinit
#prompt gentoo
# }}}


# rbenv {{{
export RBENV_ROOT=/usr/local/rbenv
export PATH="$RBENV_ROOT/bin:$PATH"
eval "$(rbenv init -)"
# }}}

# python
export PYTHONSTARTUP=$HOME/.pythonstartup

# virtualenv
export VIRTUALENV_USE_DISTRIBUTE=true
if [ -f /usr/bin/virtualenvwrapper.sh ]; then
  export WORKON_HOME=/usr/local/virtualenvs
  source /usr/bin/virtualenvwrapper.sh
fi

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

