#!/bin/zsh

# completion {{{
autoload -U compinit && compinit
# }}}

# espace {{{
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
autoload -Uz git-escape-magic # after url-quote-magic
git-escape-magic

# }}}

# correction {{{
#setopt correctall
# }}}

# cd {{{
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
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

# keys {{{
bindkey -e
#bindkey -v
# }}}

# prompt {{{
function git_prompt {
  local branch branch_color head head_color
  branch=`git symbolic-ref HEAD 2>/dev/null | cut -d'/' -f3`
  if [[ -z $branch ]]; then
    return
  fi
  if [[ -n `git status | grep "^nothing to"` ]]; then
    branch_color="085"
  else
    branch_color="126"
  fi
  head=`git rev-parse --verify -q HEAD 2>/dev/null | cut -c 1-8`
  head_color="229"
  echo "%F{$branch_color}‹$branch›%f %F{$head_color}$head%f"
}
setopt prompt_subst
PROMPT='%F{029}« %m »%f %F{077}%~%f `git_prompt`
%F{219}%#%f '
#autoload -U promptinit
#promptinit
#prompt gentoo
# }}}

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
