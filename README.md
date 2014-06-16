# .zsh

## Prompt

```
# spring
PROMPT="%F{029}%m%f %F{077}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
%F{219}%#%f "
# summer
PROMPT="%F{026}%m%f %F{074}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
%F{103}%#%f "
```

## Startup files

0. `/etc/zsh/zshenv`
1. ` $HOME/.zshenv`
2. `/etc/zsh/zprofile` and `$HOME/.zprofile`
3. `/etc/zshrc` and `$HOME/.zshrc`
4. `/etc/zsh/zlogin` and `$HOME/.zlogin`

## Note

`/etc/zsh/zprofile` of Gentoo clears environment variables with `unset`.
