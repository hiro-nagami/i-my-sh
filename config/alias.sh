

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

function git_paths()
{
	echo $(ghq list -p | peco)
}

function gcd()
{
	cd $(git_paths)
}
