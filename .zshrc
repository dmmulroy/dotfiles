# oh my zsh
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z fnm node npm brew tmux zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# aliases
alias vim=nvim
alias omzr="omz reload"
alias c="clear"

# starship.rs
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init zsh)"

# fnm
export PATH="/home/$(whoami)/.local/share/fnm:$PATH"
eval "`fnm env`"

# oh my zsh tmux plugin env vars
export ZSH_TMUX_CONFIG="$HOME/.config/tmux"
export ZSH_TMUX_AUTOSTART=true
