# setup path
export MYSH_DIR="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"

# GO
export GOPATH=$HOME/.go

if [ -z "$MYSH_CENTOS" ] && [ "${MYSH_CENTOS:-A}" = "${MYSH_CENTOS-A}" ]; then
    export GOROOT=/usr/local/bin/go	# for CentOS
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

# colors
if which tput >/dev/null 2>&1; then
  ncolors=$(tput colors)
fi
if [ -t 1 ] && [ -n "$ncolors" ] && [ "$ncolors" -ge 8 ]; then
  RED="$(tput setaf 1)"
  GREEN="$(tput setaf 2)"
  YELLOW="$(tput setaf 3)"
  BLUE="$(tput setaf 4)"
  BOLD="$(tput bold)"
  NORMAL="$(tput sgr0)"
else
  RED=""
  GREEN=""
  YELLOW=""
  BLUE=""
  BOLD=""
  NORMAL=""
fi
