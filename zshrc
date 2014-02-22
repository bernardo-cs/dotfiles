# Path to your oh-my-zsh configuration.
# Load brew bins first
PATH="/usr/local/sbin:/usr/local/bin:$PATH"
ZSH=$HOME/.oh-my-zsh
# Add bash aliases to zsh
source $HOME/.bash_aliases
# Add php55 form homebrew
#PATH="$(brew --prefix josegonzalez/php/php55)/bin:$PATH"
PATH="#{HOMEBREW_PREFIX}/bin:$PATH"
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="agnoster"
DEFAULT_USER="bersimoes"

#add z
. ~/Documents/coding/z/z.sh

#add rbenv
eval "$(rbenv init -)"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often before auto-updates occur? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git rails ruby)

source $ZSH/oh-my-zsh.sh

# Customize to your needs...
export PATH=$PATH:/Users/bersimoes/android-sdks/platform-tools:/Applications/SenchaSDKTools-2.0.0-beta3:/Volumes/vinil\ 1/Dropbox/IST/EADW/labs:/Users/bersimoes/AWS/elastic-mapreduce-cli/elastic-mapreduce-ruby:/Users/bersimoes/.rvm/gems/ruby-1.9.3-p392/bin:/Users/bersimoes/.rvm/gems/ruby-1.9.3-p392@global/bin:/Users/bersimoes/.rvm/rubies/ruby-1.9.3-p392/bin:/Users/bersimoes/.rvm/bin:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/opt/X11/bin:/usr/texbin:/Users/bersimoes/AWS/ec2/bin

#seting up locals for utf8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

#autocompletion
autoload predict-on
predict-toggle() {
	  ((predict_on=1-predict_on)) && predict-on || predict-off
  }
  zle -N predict-toggle
  bindkey '^Z'   predict-toggle
  zstyle ':predict' toggle true
  zstyle ':predict' verbose true
# set colors
