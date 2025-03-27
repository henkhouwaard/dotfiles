#!/usr/bin/env zsh

###############################
# EXPORT ENVIRONMENT VARIABLE #
###############################

# Only set TERM if not already set
export TERM=${TERM:-rxvt-256color}

export DOTFILES="$HOME/.dotfiles"
export WORKSPACE="$HOME/code"

# editor
export EDITOR="nvim"
export VISUAL="nvim"

# zsh
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


# git
export GIT_REVIEW_BASE="main" # See gitconfig

if [ -d /opt/homebrew ]; then
  HOMEBREW_PREFIX="/opt/homebrew"
elif
  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  HOMEBREW_PREFIX="$(brew --prefix)"
elif command -v brew &>/dev/null; then
  HOMEBREW_PREFIX="$(brew --prefix)"
fi
export PATH="$HOMEBREW_PREFIX/bin:$HOMEBREW_PREFIX/sbin:$XDG_CONFIG_HOME/node_modules/bin:$HOME/.yarn/bin:$HOME/.dotnet/tools:$PATH"

# help!
HELPDIR="/usr/share/zsh/5.9/help"
unalias run-help
autoload run-help

# +------------+
# | NAVIGATION |
# +------------+

setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

# +---------+
# | HISTORY |
# +---------+

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.


# vim
bindkey -v
export KEYTIMEOUT=1

# vim cursor stuff
cursor_mode() {
    # See https://ttssh2.osdn.jp/manual/4/en/usage/tips/vim.html for cursor shapes
    cursor_block='\e[2 q'
    cursor_beam='\e[6 q'

    zle-keymap-select() {
        if [[ ${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne $cursor_block
        elif [[ ${KEYMAP} == main ]] ||
            [[ ${KEYMAP} == viins ]] ||
            [[ ${KEYMAP} = '' ]] ||
            [[ $1 = 'beam' ]]; then
            echo -ne $cursor_beam
        fi
    }

    zle-line-init() {
        echo -ne $cursor_beam
    }

    zle -N zle-keymap-select
    zle -N zle-line-init
}

cursor_mode

# edit the current command line in nvim
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# activate the text objects, no idea how this works :-)
autoload -Uz select-bracketed select-quoted
zle -N select-quoted
zle -N select-bracketed
for km in viopp visual; do
  bindkey -M $km -- '-' vi-up-line-or-history
  for c in {a,i}${(s..)^:-\'\"\`\|,./:;=+@}; do
    bindkey -M $km $c select-quoted
  done
  for c in {a,i}${(s..)^:-'()[]{}<>bB'}; do
    bindkey -M $km $c select-bracketed
  done
done

if command -v brew &>/dev/null; then
  # syntax highlighting!
  source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

  # setup autosuggestions
  source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  bindkey '^y' autosuggest-execute

  # NPM
  [ -s "$(brew --prefix nvm)/nvm.sh" ] && \. "$(brew --prefix nvm)/nvm.sh"  # This loads nvm
  [ -s "$(brew --prefix nvm)/etc/bash_completion.d/nvm" ] && \. "$(brew --prefix nvm)/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
fi

export NPM_PATH="$XDG_CONFIG_HOME/node_modules"
export NPM_BIN="$XDG_CONFIG_HOME/node_modules/bin"
export NVM_DIR="$HOME/.nvm"

if command -v zoxide &>/dev/null; then
  eval "$(zoxide init zsh)"
fi
if command -v starship &>/dev/null; then
  eval "$(starship init zsh)"
fi

source "$ZDOTDIR/aliases.sh"
if command -v fzf &>/dev/null; then
    source "$ZDOTDIR/fzf.zsh"
fi
#if ! colima status &>/dev/null; then ~/.config/colima/autostart.sh; fi
