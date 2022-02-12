#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

# GO
# export GOPATH=$HOME/.go
export GOENV_ROOT="$HOME/.goenv"
export PATH="$GOENV_ROOT/bin:$PATH"
eval "$(goenv init -)"
# export PATH="$GOROOT/bin:$PATH"
# export PATH="$PATH:$GOPATH/bin"

if [ -n "$MYSH_CENTOS" ] && [ "${MYSH_CENTOS:-A}" = "${MYSH_CENTOS-A}" ]; then
    # export GOROOT=/usr/local/bin/go	# for CentOS
elif [ -n "$MYSH_MACOS" ] && [ "${MYSH_MACOS:-A}" = "${MYSH_MACOS-A}" ]; then
  # export GOROOT="$GOENV_ROOT/versions/$(goenv whence go)"	# for Mac
fi

# export PATH=$PATH:$GOPATH/bin:$GOROOT/bin

# git
export GIT_REPOS=$HOME/.ghq/github.com/git/git

# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000


# Android Studio
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/tools/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

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
