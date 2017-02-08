# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

source "$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/config.sh"

# common alias
source $CURRENT_DIR/alias.sh
source $CURRENT_DIR/git-alias.sh
