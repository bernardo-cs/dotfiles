# Path to your oh-my-zsh configuration.
PATH="/usr/local/sbin:/usr/local/bin:$PATH"

# Load brew bins first
ZSH=$HOME/.oh-my-zsh

# Set theme, user and editor 
#ZSH_THEME="af-magic"
ZSH_THEME="agnoster"
DEFAULT_USER="bernardosimoes"
export "EDITOR=vim"

#add z
. /src/clones/z/z.sh

#add rbenv
#eval "$(rbenv init - --no-rehash)"
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Add bash aliases, and API keys to zsh
source $HOME/.bash_aliases
source $HOME/.apikeys
 
# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
plugins=(git rails ruby brew bundler rbenv history-substring-search)
source $ZSH/oh-my-zsh.sh

#seting up locals for utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Vi mode
bindkey -v

# Kill the esc lag
export KEYTIMEOUT=1

# Distiguish vi-style insert from normal mode
function zle-line-init zle-keymap-select {
 VIM_PROMPT="%{$fg_bold[red]%}✪ %{$reset_color%}"
  RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/ }"
  RPS2=$RPS1
  zle reset-prompt
}
zle -N zle-line-init
zle -N zle-keymap-select

# Vi mode breaks history navigation with the arrow keys,
# this fixes it
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

## Load SSH Agent
SSH_ENV=$HOME/.ssh/environment
   
# start the ssh-agent
function start_agent {
    echo "Initializing new SSH agent..."
    # spawn ssh-agent
    /usr/bin/ssh-agent | sed 's/^echo/#echo/' > "${SSH_ENV}"
    echo succeeded
    chmod 600 "${SSH_ENV}"
    . "${SSH_ENV}" > /dev/null
    /usr/bin/ssh-add
}
   
if [ -f "${SSH_ENV}" ]; then
     . "${SSH_ENV}" > /dev/null
     ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
        start_agent;
    }
else
    start_agent;
fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
