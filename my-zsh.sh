# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# Set environment for pyhton
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8

source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config/config.sh"

# common alias
source $MYSH_DIR/alias.sh
source $MYSH_DIR/git-alias.sh

# prompt
setopt PROMPT_SUBST
fpath=($(brew --prefix)/sharfe/zsh/site-functions $fpath)
autoload -U compinit
compinit -u

GIT_PS1_SHOWDIRTYSTATE=true
export PS1=$'%{\e[32m%}%n@%m%{\e[00m%}:%{\e[34m%}%35<...<%~%<..<%{\e[31m%}$(__git_ps1)%{\e[00m%}\$ '


# Setup zsh-autosuggestions
source $GIT_REPOS/contrib/completion/git-prompt.sh
source $HOME/.ghq/github.com/zsh-users/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=4'
COMPLETION_WAITING_DOTS=true

# Enable autosuggestions automatically
# zle-line-init() {
#     zle autosuggest-start
# }

# zle -N zle-line-init

## rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
