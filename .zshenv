
###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

export TERM='rxvt-256color'
export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/code"
export HOMEBREW_PREFIX="/opt/homebrew"

[ -f "$DOTFILES/install_config" ] && source "$DOTFILES/install_config"

# XDG
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_HOME=$XDG_CONFIG_HOME/local/share
export XDG_CACHE_HOME=$XDG_CONFIG_HOME/cache

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export HISTFILE="$ZDOTDIR/.zhistory"    # History filepath
export HISTSIZE=10000                   # Maximum events for internal history
export SAVEHIST=10000                   # Maximum events in history file

# other software
export VIMCONFIG="$XDG_CONFIG_HOME/nvim"

# Man pages
export MANPAGER='nvim +Man!'

# golang
export GOPATH="$WORKSPACE/go"
export GOCACHE="$XDG_CACHE_HOME/go-build"

# NPM
export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"

# git
export GIT_REVIEW_BASE=main # See gitconfig

# from xdg-ninja
# nvm
export NVM_DIR="$XDG_DATA_HOME/nvm"
[ -s "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" ] && \. "$HOMEBREW_PREFIX/opt/nvm/nvm.sh" # This loads nvm
[ -s "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" ] && \. "$HOMEBREW_PREFIX/opt/nvm/etc/bash_completion.d/nvm" # This loads nvm bash_completion


# PATH WOULD IDEALLY BE SET IN THIS FILE, BUT HOMEBREW...
