#/bin/sh
if $DEBUG_MY_SH ; then
  echo "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/$(basename "$(test -L "$0" && readlink "$0" || echo "$0")")"
fi

export HISTSIZE=1000
export SAVEHIST=100000

export SOURCED_MYSH=true
export MYSH_MACOS=true

# Set environment for pyhton
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

# Set MYSH_DIR
export MYSH_DIR="$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)"
source $MYSH_DIR/config/config.sh

# common alias
source $MYSH_DIR/config/path.sh
source $MYSH_DIR/config/alias.sh
source $MYSH_DIR/config/git-alias.sh

if [[ -e $MYSH_DIR/others/other_imports.sh ]]; then
  source $MYSH_DIR/others/other_imports.sh
fi

if [[ -e ./others/others_imports.sh ]]; then
  source ./others/others_imports.sh
fi

if type pyenv > /dev/null 2>&1; then
  eval "$(pyenv init -)"
fi

if type jenv > /dev/null 2>&1; then
  export JENV_ROOT="$HOME/.jenv"
  export PATH="$JENV_ROOT/bin:$PATH"
  eval "$(jenv init -)"
  export JAVA_HOME="$(jenv prefix)"
  alias jenv_set_java_home='export JAVA_HOME="$(jenv prefix)"'
fi

if type ruby > /dev/null 2>&1 && type gem > /dev/null 2>&1; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

# prompt
setopt nonomatch
setopt PROMPT_SUBST
if type brew > /dev/null 2>&1; then
  fpath=($(brew --prefix)/sharfe/zsh/site-functions $fpath)
fi
autoload -U promptinit; promptinit
prompt pure
autoload -U compinit
compinit -u

GIT_PS1_SHOWDIRTYSTATE=true
export PS1=$'\e[104m %D{%Y/%m/%d} %* \e[1;46m %~% \e[0;46m%{\$(__git_ps1 " (%s)")%} \e[49m \e[0m \n\$ '

# Setup zsh-autosuggestions
if [[ -e $GIT_REPOS/contrib/completion/git-prompt.sh ]]; then
  source $GIT_REPOS/contrib/completion/git-prompt.sh
fi

GHQ_HOME=$HOME/.ghq
ZSH_AUTOSUGGESTIONS_SH=$GHQ_HOME/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
if [[ -e $ZSH_AUTOSUGGESTIONS_SH ]]; then
  source $ZSH_AUTOSUGGESTIONS_SH
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
fi

COMPLETION_WAITING_DOTS=true

# Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }

# zle -N zle-line-init

## rbenv
if type rbenv > /dev/null 2>&1; then
  eval "$(rbenv init -)"
fi
