#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

git config --global ghq.root '~/.ghq'

#Alias (git)
alias gst='git status'
alias giff='git diff'
alias gl='git log '
alias gl1='gl --oneline'
alias gb='git branch'
alias gba='git branch -a'
alias gv='git remote -v'
alias gf='git fetch'
alias gfp='git fetch --prune'
alias gbd='git branch -D'
