#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

PATH=/usr/local/bin:$PATH
PATH=$HOME/.fastlane/bin:$PATH
PATH=$HOME/.rbenv/bin:$PATH
PATH=/usr/local/sbin:$PATH
PATH=$HOME/flutter/bin:$PATH

## openssl
PATH=/usr/local/opt/openssl/bin:$PATH
