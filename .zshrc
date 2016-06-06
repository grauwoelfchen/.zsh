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
# go-overlay
# eval "$(direnv hook zsh)"
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
# note
#   ^  := ctrl
#   ^[ := esc
bindkey -e
# bindkey -v
bindkey '^p'   history-beginning-search-backward
bindkey '^n'   history-beginning-search-forward
bindkey '^[\-' quote-line
bindkey '^H'   slash-backward-kill-word
## default
#bindkey 'tab'  expand-or-complete
#bindkey '^[q'  push-line
#bindkey '^[a'  accept-and-hold
#bindkey '^[h'  run-help
#bindkey '^[\'' quote-line
#bindkey '^?'   delete-char
# }}}

### prompt {{{
[ -f $HOME/.sh.d/src/git-prompt.sh ] && source $HOME/.sh.d/src/git-prompt.sh
setopt prompt_subst
# spring
#PROMPT="%F{029}%m%f %F{077}%~%f \$(git_prompt)\$(uptime | \
#awk -F': ' '{ print \$2 }')
#%F{219}%#%f "
# summer
PROMPT="%F{026}%m%f %F{074}%~%f \$(git_prompt)\$(uptime | \
awk -F': ' '{ print \$2 }')
%F{103}%#%f "
#autoload -U promptinit
#promptinit
#prompt gentoo
# }}}

### widgets {{{
slash-backward-kill-word() {
  local WORDCHARS="${WORDCHARS:s@/@}"
  zle backward-kill-word
}
zle -N slash-backward-kill-word
# }}}

### utils {{{
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
    ahead=`git rev-list remotes/"${remote}"/master..${branch} \
           --count 2>/dev/null`
    behind=`git rev-list ${branch}..remotes/"${remote}"/master \
            --count 2>/dev/null`
    printf "%-30s %16s | %-15s %s\n" "$branch" \
           "(behind $behind)" "(ahead $ahead)" "remotes/${remote}/master"
  done
}

function whymask() {
  find /usr/portage/profiles/ -type f -name '*.mask' -exec \
    awk -vRS= "/${*/\//.}/ {
      print \" \" FILENAME \":\", \"\n\" \"\n\" \$0 \"\n\"
    }" {} + 2>/dev/null | less
}

function quicklisp-init() {
  (curl -L http://beta.quicklisp.org/quicklisp.lisp && \
   echo '(quicklisp-quickstart:install :path #P".quicklisp/")') | clisp
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

function restore-tabs() {
  cat $HOME/urls.txt | \
    while read line; do firefox -new-tab $line >/dev/null 2>&1; done
}

# GnuPG (agent) {{{
[ -z "$(pgrep gpg-agent)" ] && eval "$(gpg-agent --daemon)"
export GPG_TTY=`tty`
# < 2.1.11
# [ -z "$(pgrep gpg-agent)" ] && \
#   eval $(gpg-agent --daemon --write-env-file $HOME/.gpg-agent-info)
# [ -f $HOME/.gpg-agent-info ] && \
#   source $HOME/.gpg-agent-info
# export GPG_AGENT_INFO
# export GPG_TTY=`tty`
# }}}

# private .zshrc
[ -f $HOME/.zsh/.zshrc.metal ] && source $HOME/.zsh/.zshrc.metal
# }}}

### vendors {{{
# travis
[ -f $HOME/.travis/travis.sh ] && source $HOME/.travis/travis.sh
# }}}

### bundle {{{
BUNDLE="$HOME/.zsh/bundle"
autoload -Uz git-escape-magic
git-escape-magic
## autoenv
source $BUNDLE/zsh-autoenv/autoenv.zsh
AUTOENV_FILE_ENTER=.autoenv
AUTOENV_FILE_LEAVE=.autoenv.leave
## syntax-highlight
ZSH_HIGHLIGHT_HIGHLIGHTERS_DIR="$BUNDLE/zsh-syntax-highlighting/highlighters"
source $BUNDLE/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
ZSH_HIGHLIGHT_STYLES[unknown-token]="fg=088"
ZSH_HIGHLIGHT_STYLES[alias]="fg=cyan"
ZSH_HIGHLIGHT_STYLES[path]="fg=182"
ZSH_HIGHLIGHT_STYLES[builtin]="fg=225"
ZSH_HIGHLIGHT_STYLES[globbing]="fg=yellow"
ZSH_HIGHLIGHT_STYLES[command]="fg=066"
# }}}
