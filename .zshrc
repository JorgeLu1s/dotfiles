# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
ZSH_THEME="robbyrussell"

# Note: zsh-syntax-highlighting needs to be the last element of the array
plugins=(git ruby rails history-substring-search asdf)

# Allow [, ],or ?
unsetopt nomatch

source $HOME/.aliases
source $ZSH/oh-my-zsh.sh

export PATH="$HOME/bin:/usr/local/bin:$PATH:/opt/nvim/:$PATH:/usr/local/go/bin"
export EDITOR='nvim'

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# export VOLTA_HOME=$HOME/.volta
# export PATH="/usr/local/opt/libpq/bin:/Users/fullstacklabs/go/bin:$PATH"

export PGSERVICE=dockerservice

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
