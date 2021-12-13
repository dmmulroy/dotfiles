# Path to your oh-my-zsh installation.
export ZSH="/Users/dillonmulroy/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git npm fnm colored-man-pages command-not-found web-search copydir copyfile z zsh-autosuggestions)

source $ZSH/oh-my-zsh.sh

# aliases
alias insomnia="open -a insomnia"
alias todo="open -a todoist"
alias notion="open -a notion"
alias linear="open -a linear"
alias datagrip="open -a datagrip"
alias dg="datagrip"
alias start-docker="Open -a Docker"
alias wttr="http wttr.in"
alias ls='colorls --group-directories-first --almost-all --dark' # list all files and directories
alias ll='colorls --group-directories-first --almost-all --long --dark' # list all files and directories wiht detailed list view
alias lf='colorls -f --almost-all --dark' # list all files
alias ld='colorls -d --almost-all --dark' # list all directories
alias tree='colorls --tree=3 --almost-all --dark' # list all files + dirs in a tree view 3 layers deep

# fnm
export PATH=/Users/dillonmulroy/.fnm:$PATH
eval "`fnm env`"

# starship.rs
eval "$(starship init zsh)"
export STARSHIP_CONFIG=~/.starship/config.toml
export STARSHIP_CACHE=~/.starship/cache

# cloud_sql_proxy
source /usr/local/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc

# zsh-syntax-highlighting plugin (installed via brew) 
source /usr/local/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 
