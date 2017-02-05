

# alias (standard)
alias srczsh='source $ZSHRC && echo sink zsh.'
alias vimzsh='vim $ZSHRC && echo open zsh.'
alias editzsh='vimzsh && srczsh'

alias l='ls'
alias la='ls -a'
alias ll='l -l'
alias lla='ll -a'
alias lg='la | grep'

alias psgrp='ps aux | grep'

#Alias (git)
alias gst='git status'
alias giff='git diff'
alias gl='git log '
alias gl1='gl --oneline'
alias gb='git branch'
alias gba='git branch -a'
alias gv='git remote -v'
