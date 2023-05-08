# oh my zsh
export ZSH="$HOME/.config/oh-my-zsh"

ZSH_THEME="robbyrussell"

plugins=(git z fnm node npm yarn brew fd fzf zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Set bat's color theme
export BAT_THEME="Catppuccin-macchiato"

# aliases
alias vim=nvim
alias omzr="omz reload"
alias c="clear"
alias cat="bat"
# gmo -> git merge origin
alias gmo='git checkout $(git remote show origin | grep "HEAD branch" | cut -d " " -f5) && git pull && git checkout - && git merge $(git remote show origin | grep "HEAD branch" | cut -d " " -f5)'
# grb -> git checkout recent branch
alias grb='git branch --sort=-committerdate | grep -v "$(git branch --show-current)" | fzf --header "Checkout Recent Branch ( $(git branch --show-current))" --preview "git diff {1} --color=always" --pointer="" | xargs git checkout'
# hist -> Better history search
alias hist='history | cut -c 8- | tail -r | fzf --header "History - Press Enter to copy command to clipboard" --pointer="" --bind "enter:execute-silent(echo -n {1..} | pbcopy)+abort"'

# functions
# fvim -> find and open a file in vim
function fvim() {
    if [[ $# -eq 0 ]]; then
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" | xargs nvim
    else
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" -q "$@" | xargs nvim
    fi
}

# fzf
export FZF_DEFAULT_OPTS="--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down --preview 'bat --color=always{}'"

# git
export GIT_EDITOR=nvim

# gpg
export GPG_TTY=$(tty) 

# starship.rs
export STARSHIP_CONFIG=~/.config/starship/config.toml
export STARSHIP_CACHE=~/.config/starship/cache
eval "$(starship init zsh)"

# fnm
export PATH="/home/$USER/.local/share/fnm:$PATH"
eval "`fnm env`"

# opam configuration
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# bun completions
[ -s "/Users/dillon/.bun/_bun" ] && source "/Users/dillon/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"


