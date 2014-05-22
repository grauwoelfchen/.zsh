#!/bin/zsh

### completion {{{
autoload -U compinit && compinit
# }}}

### escape{{{
setopt rcquotes
autoload -Uz url-quote-magic
zle -N self-insert url-quote-magic
# }}}

### correction {{{
#setopt correctall
# }}}

### cd {{{
setopt autocd
setopt auto_pushd
setopt pushd_ignore_dups
# }}}

### glob {{{
setopt extendedglob
# }}}

### history {{{
setopt hist_ignore_all_dups
setopt hist_ignore_space
export HISTSIZE=2000
export HISTFILE="$HOME/.zsh/.zsh-history"
export SAVEHIST=$HISTSIZE
#}}}

### color {{{
autoload -U colors && colors
## completion
eval `dircolors`
zstyle ':completion:*:default' list-colors ${LS_COLORS}
# }}}

### keys {{{
bindkey -e
#bindkey -v
bindkey '^p' history-beginning-search-backward
bindkey '^n' history-beginning-search-forward
bindkey '^[\-' quote-line
## default
#bindkey 'tab'  expand-or-complete
#bindkey '^[q'  push-line
#bindkey '^[a'  accept-and-hold
#bindkey '^[h'  run-help
#bindkey '^?'   delete-char
#bindkey '^[\'' quote-line
# }}}

### prompt {{{
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

### bundle {{{
autoload -Uz git-escape-magic
git-escape-magic
autoload -Uz zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$HOME/.zsh/bundle/zsh-syntax-highlighting/highlighters"
zsh-syntax-highlighting.zsh
## syntax-highlight
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=088"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path]="fg=182"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=225"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[command]="fg=066"
# }}}

### commands - experiment {{{
function st-branch() {
  local branch remote ahead behind
  if [[ -n $1 ]]; then
    remote=$1
  else
    remote="upstrm"
  fi
  git for-each-ref --format="%(refname:short)" refs/heads refs/remotes | \
  while read branch
  do
    ahead=`git rev-list remotes/"${remote}"/master..${branch} --count 2>/dev/null`
    behind=`git rev-list ${branch}..remotes/"${remote}"/master --count 2>/dev/null`
    printf "%-30s %16s | %-15s %s\n" "$branch" "(behind $behind)" "(ahead $ahead)" "remotes/${remote}/master"
  done
}

function quicklisp-init() {
  (curl -L http://beta.quicklisp.org/quicklisp.lisp && echo '(quicklisp-quickstart:install :path #P".quicklisp/")') | clisp
}

function genpasswd() {
  local length
  if [[ -n $1 ]]; then
    length=$1
  else
    length=8
  fi
  tr -dc A-Za-z0-9_ < /dev/urandom | head -c ${length} | xargs
}
# }}}
