#!/usr/bin/env zsh

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

setopt CORRECT              # Spelling correction
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

source $ZDOTDIR/completion.zsh
source $ZDOTDIR/aliases.sh
if [ $(command -v "fzf") ]; then
    source $ZDOTDIR/fzf.zsh
fi

# prompt
# fpath=($ZDOTDIR $fpath)
# autoload -Uz prompt; prompt
eval "$(starship init zsh)"

# stacks
setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

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

# syntax highlighting!
source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# We ideally want this in .zshenv, but that is incompatible with homebrew
export PATH="$NPM_BIN:$PATH"                                        # NPM
export PATH="$HOMEBREW_PREFIX/bin:$PATH"
export PATH="/opt/homebrew/Caskroom/sqlcl/24.1.0.087.0929/sqlcl/bin:$PATH"
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
#
# setup my private python virtual environment
export VIRTUAL_ENV_DISABLE_PROMPT=1
venv="$HOME/.venv"
if [[ ! -d "$venv" ]]
then
    mkdir "$venv"
    python3 -m venv $venv
fi
source "$venv/bin/activate"

# unbind this, because it isn't working when using vim tmux navigator
bindkey -r "^L"
#
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# setup zoxide
eval "$(zoxide init zsh)"

# setup autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh
bindkey '^y' autosuggest-execute
