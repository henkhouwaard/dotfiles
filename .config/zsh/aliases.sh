#!/usr/bin/env bash

# +--------+
# | System |
# +--------+

# alias shutdown='sudo shutdown now'
# alias restart='sudo reboot'
# alias suspend='sudo pm-suspend'

alias bigf= 'find / -xdev -type f -size +500M'  # display "big" files > 500M

# +-----+
# | Zsh |
# +-----+

alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index} > /dev/null"; unset index # directory stack
alias sc='source $ZDOTDIR/.zshrc'

# +----+
# | ls |
# +----+

alias ls='ls --color=auto'
alias l='ls -l'
alias ll='ls -lahF'
alias lls='ls -lahFtr'
alias la='ls -A'
alias lc='ls -CF'

# +------+
# | wget |
# +------+
alias wget=wget --hsts-file="$XDG_DATA_HOME/wget-hsts"

# +----+
# | cp |
# +----+

alias la='ls -alh'

# +------+
# | grep |
# +------+

alias grep="grep -i --color=auto"

# +------+
# | pccopy |
# +------+

alias cb='pbcopy'

# +------+
# | ping |
# +------+

alias pg='ping 8.8.8.8'

# +------+
# | time |
# +------+

alias time='/usr/bin/time'

# +-----+
# | bat |
# +-----+

alias batl='bat --paging=never -l log'

# +--------+
# | Golang |
# +--------+

alias gob="go build"
alias gor="go run" 
alias goc="go clean -i"
alias gta="go test ./..."       # go test all
alias gia="go install ./..."    # go install all

# +---------+
# | netstat |
# +---------+

alias port="netstat -tulpn | grep"

# +--------+
# | Neovim |
# +--------+

alias vim='nvim'
alias vi='nvim'
alias svim='sudoedit'
alias nvimc='rm -I $VIMCONFIG/swap/*'             # clean nvim swap file
alias nvimcu='rm -I $VIMCONFIG/undo/*'            # clean the vim undo
alias nviml='nvim -w $VIMCONFIG/vimlog "$@"'      # log the keystrokes 
alias nvimd='nvim --noplugin -u NONE'             # launch nvim without any plugin or config (nvim debug)
alias lvim='\vim -c "set nowrap|syntax off"'        # fast vim for big files / big oneliner

# +-----+
# | Git |
# +-----+

alias gs='git status'
alias gss='git status -s'
alias ga='git add'
alias gps='git push'
alias gpl='git pull'
alias gpraise='git blame'
alias gpo='git push origin'
alias gpt='git push --tag'
alias gtd='git tag --delete'
alias gtdr='git tag --delete origin'
alias grb='git branch -r'                                                                           # display remote branch
alias gplo='git pull origin'
alias gb='git branch '
alias gc='git commit'
alias gca='git commit -a'
alias gd='git diff'
alias gco='git checkout'
alias gl='git log --oneline'
alias gr='git remote'
alias grs='git remote show'
alias glol='git log --graph --abbrev-commit --oneline --decorate'
alias gclean="git branch --merged | grep  -v '\\*\\|master\\|develop' | xargs -n 1 git branch -d" # Delete local branch merged with master
alias gblog="git for-each-ref --sort=committerdate refs/heads/ --format='%(HEAD) %(color:red)%(refname:short)%(color:reset) - %(color:yellow)%(objectname:short)%(color:reset) - %(contents:subject) - %(authorname) (%(color:blue)%(committerdate:relative)%(color:reset))'"                                                             # git log for each branches
alias dif="git diff --no-index"                                                                   # Diff two files even if not in git repo! Can add -w (don't diff whitespaces)

# +------+
# | tmux |
# +------+

alias tmuxk='tmux kill-session -t'
alias tmuxa='tmux attach -t'
alias tmuxl='tmux list-sessions'

# +------+
# | lynx |
# +------+

alias lynx='lynx -vikeys -accept_all_cookies'

# +--------+
# | docker |
# +--------+
alias dockls="docker container ls | awk 'NR > 1 {print \$NF}'"                  # display names of running containers
alias dockRr='docker rm $(docker ps -a -q)'                                     # delete every containers / images
alias dockRr='docker rm $(docker ps -a -q) && docker rmi $(docker images -q)'   # delete every containers / images
alias dockstats='docker stats $(docker ps -q)'                                  # stats on images
alias dockimg='docker images'                                                   # list images installed
alias dockprune='docker system prune -a'                                        # prune everything
alias dockceu='docker-compose run --rm -u $(id -u):$(id -g)'                    # run as the host user
alias dockce='docker-compose run --rm'

# +----------------+
# | docker-compose |
# +----------------+

alias docker-compose-dev='docker-compose -f docker-compose-dev.yml' # run a different config file than the default one

# Folders
alias work="$HOME/workspace"
alias doc="$HOME/Documents"
alias dow="$HOME/Downloads"
alias dot="$HOME/.dotfiles"

# Golang
alias gosrc="$GOPATH/src/" # golang src
alias gobin="$GOPATH/bin/" # golang bin

# +---------+
# | scripts |
# +---------+

alias ddg="duckduckgo"
alias wiki="wikipedia"
