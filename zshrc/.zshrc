# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="fwalch" # robbyrussell fwalch

# Note: zsh-syntax-highlighting needs to be the last element of the array
plugins=(git ruby rails history-substring-search asdf)

# Allow [, ],or ?
unsetopt nomatch

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/bin:/opt/nvim-linux-x86_64/bin/:/usr/local/go/bin:$PATH"
export EDITOR=nvim

. "$HOME/.asdf/asdf.sh"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

export PGSERVICE=dockerservice

export DISABLE_SPRING=true
