# setup zsh command history
export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000

# path
BASHRC=$HOME/.bashrc
ZSHRC=$HOME/.zshrc

# common alias
# readlink or CURRENT_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)
source $HOME/.settings/alias.sh
