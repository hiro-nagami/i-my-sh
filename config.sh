# setup path
export MYSH_DIR="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"

# GO
export GOPATH=$HOME/.go

if [ -z "$MYSH_CENTOS" ] && [ "${MYSH_CENTOS:-A}" = "${MYSH_CENTOS-A}" ]; then
    export GOROOT=/usr/local/go	# for CentOS
elif [ -z "$MYSH_MACOS" ] && [ "${MYSH_MACOS:-A}" = "${MYSH_MACOS-A}" ]; then
    export GOROOT=/usr/local/opt/go/libexec	# for Mac
fi

export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# git
export GIT_REPOS=$HOME/.ghq/github.com/git/git

# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
