HISTSIZE=99999
HISTFILESIZE=999999
SAVEHIST=$HISTSIZE

alias ll='eza -la --icons=always'
eval "$(starship init zsh)"
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

alias vim='/opt/homebrew/bin/nvim'

# Ensure our $HOME/bin directory is in PATH
PATH=$HOME/bin:$PATH

bindkey -e
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1
export GO111MODULE=on

. /usr/local/opt/asdf/asdf.sh

autoload -Uz compinit
compinit

export EDITOR=vim
export GPG_TTY=$(tty)
export GO111MODULE=on
export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/usr/local/opt/openssl/lib/pkgconfig

ulimit -n 1024
