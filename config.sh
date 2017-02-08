# setup path
export MYSH_DIR="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"

# GO
export GOPATH=$HOME/.go
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# git
export GIT_REPOS=$HOME/.git

# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
