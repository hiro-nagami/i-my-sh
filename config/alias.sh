#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

# alias (standard)
alias srczsh='source $ZSHRC && echo sink zsh.'
alias vimzsh='vim $ZSHRC && echo open zsh.'
alias editzsh='vimzsh && srczsh'

alias l='ls'
alias la='ls -a'
alias ll='l -l'
alias lla='ll -a'
alias lg='la | grep'
alias t='touch'

alias get_script_path=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
alias get_script_name=$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")

alias psgrp='ps aux | grep'

function git_paths()
{
	echo $(ghq list -p | peco)
}

function gcd()
{
	cd $(git_paths)
}
