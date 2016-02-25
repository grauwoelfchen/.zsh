# .zsh

## Setup

```
% cd
% git clone git@github.com:grauwoelfchen/.zsh.git && cd .zsh
% git submodule update --init
```

## Prompt

```
# spring
PROMPT="%F{029}%m%f %F{077}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
%F{219}%#%f "
# summer
PROMPT="%F{026}%m%f %F{074}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
%F{103}%#%f "
```


## Note

### Private .zshrc

Put `.zshrc.metal` into `.zsh` directory, if you want to put sensitive value in zshrc.

`\m/^_^\m/`

### .sh.d

Shared scripts in `.sh.d` directory are universal. (zsh, bash)

### .env autoloading

The astostash/stash/unstash functions are available by [zsh-autoenv](https://github.com/Tarrasch/zsh-autoenv).
To load environment variables from `.env`, put `.autoenv.zsh` like this:

```
while read -r line; do; local var=$(echo "$(eval echo $line)"); autostash $var; done < ./.env
```

See `.autoenv.zsh.sample` or use [direnv](https://github.com/direnv/direnv)

### Startup files

The files will be loaded by following order.

0. `/etc/zsh/zshenv`
1. ` $HOME/.zshenv`
2. `/etc/zsh/zprofile` and `$HOME/.zprofile`
3. `/etc/zshrc` and `$HOME/.zshrc`
4. `/etc/zsh/zlogin` and `$HOME/.zlogin`

### unset

`/etc/zsh/zprofile` of Gentoo clears environment variables with `unset`.

```
% sudo mv /etc/zsh/{zprofile,zprofile.orig}
```
