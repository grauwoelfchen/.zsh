# .zsh

Personal `.zshrc`, `.zshenv`, scripts and settings.


## Repository

https://gitlab.com/grauwoelfchen/DotZsh


## Setup

```zsh
% cd
% mkdir ~/.zfunc
% git clone git@gitlab.com:grauwoelfchen/dotzsh.git && cd .zsh
% git submodule update --init
```


## Prompt

Let's use seasonal prompt! See `~/.zshrc`.

```zsh
# winter
PROMPT="%F{239}%m%f %F{105}%~%f \$(git_prompt)\$(uptime | \
awk -F': ' '{ print \$2 }')
%F{153}❯❯❯%f "
# spring
PROMPT="%F{029}%m%f %F{077}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
#%F{219}❯❯❯%f "
# summer
PROMPT="%F{026}%m%f %F{074}%~%f \$(git_prompt)\$(uptime | awk -F'  ' '{ print \$4 }')
#%F{103}❯❯❯%f "
```

It will be something like this:

```zsh
stockhorn ~/.atelier/usr/share/path/to/a/repository/ master 0.21, 0.28, 0.17
❯❯❯ _
```

or just use `gentoo` like prompt.

```zsh
# gentoo
autoload -U promptinit
promptinit
prompt gentoo
```


## Note

### Private `.zshrc`

Put `.zshrc.metal` into `.zsh` directory, if you want to put sensitive value
in zshrc.

`\m/^_^\m/`

### `.sh.d`

Shared scripts in `.sh.d` directory are universal. (zsh, bash)

### `.env` autoloading

The astostash/stash/unstash functions are available by [zsh-autoenv](
https://github.com/Tarrasch/zsh-autoenv).
To load environment variables from `.env`, put `.autoenv.zsh` like this:

```sh
while read -r line; do; local var=$(echo "$(eval echo $line)"); autostash $var; done < ./.env
```

See `.autoenv.zsh.sample` or use [direnv](https://github.com/direnv/direnv).

### Startup files

The files will be loaded by following order.

0. `/etc/zsh/zshenv`
1. ` $HOME/.zshenv`
2. `/etc/zsh/zprofile` and `$HOME/.zprofile`
3. `/etc/zshrc` and `$HOME/.zshrc`
4. `/etc/zsh/zlogin` and `$HOME/.zlogin`

### unset

`/etc/zsh/zprofile` of Gentoo clears environment variables with `unset`.

```zsh
% sudo mv /etc/zsh/{zprofile,zprofile.orig}
```


## License

Copyright (c) 2013-2018 Yasuhiro Asaka

This is free software:  
You can redistribute it and/or modify it under the terms of
the GUN General Public License as published by the
Free Software Foundation.

See [LICENSE](LICENSE). (`GPL-2.0`)
