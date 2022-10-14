# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Note: zsh-syntax-highlighting needs to be the last element of the array
plugins=(git ruby rails history-substring-search zsh-syntax-highlighting)

# Allow [, ],or ?
unsetopt nomatch

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/bin:$PATH"
export EDITOR='nvim'

eval "$(rbenv init -)"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
