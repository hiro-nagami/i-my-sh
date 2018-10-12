#/bin/sh
if [ $DEBUG_MY_SH ]; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

source ./my-zsh.sh
