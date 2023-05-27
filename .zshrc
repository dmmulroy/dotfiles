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

# functions
# fvim -> find and open a file in vim
function fvim() {
    if [[ $# -eq 0 ]]; then
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" | xargs nvim
    else
        fd -t f | fzf --header "Open File in Vim" --preview "bat --color=always {}" -q "$@" | xargs nvim
    fi
}

# kbb -> pretty print kitty key binds
function kkb () {
  bat --file-name "Kitty key binds" -f << EOF
+--------------------------------+------------------+
| Key binds                      |                  |
+--------------------------------+------------------+
| General                        |                  |
| New kitty instance             | cmd + n          |
| History                        | ctrl + r         |
| Open URL                       | ctrl + shift + e |
+--------------------------------+------------------+
| Windows                        |                  |
| New window                     | cmd + enter      |
| Close window                   | cmd + backspace  |
| Change window layout           | cmd + '          |
| Resize window taller           | cmd + =          |
| Resize window shorter          | cmd + -          |
| Resize window wider            | cmd + 0          |
| Resize window narrower         | cmd + 9          |
| Reset window size              | cmd + 8          |
| Move window up                 | shift + up       |
| Move window down               | shift + down     |
| Move window left               | shift + left     |
| Move window right              | shift + right    |
| Move to top neighboring window | ctrl + k         |
| Move to bottom neighboring win | ctrl + j         |
| Move to left neighboring win   | ctrl + h         |
| Move to right neighboring win  | ctrl + l         |
+--------------------------------+------------------+
| Tabs                           |                  |
| New tab                        | cmd + t          |
| Set tab title                  | cmd + shift + i  |
| Move tab forward               | ctrl + shift + . |
| Move tab backward              | ctrl + shift + , |
| Next tab                       | cmd + shift + ]  |
| Previous tab                   | cmd + shift + [  |
| Close tab                      | cmd + w          |
+--------------------------------+------------------+
EOF
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

# ssh-agent# Start the ssh-agent and add all identities
eval "$(ssh-agent -s)" > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519 > /dev/null 2>&1
ssh-add  --apple-use-keychain ~/.ssh/id_ed25519_skolem > /dev/null 2>&1



export PKG_CONFIG_PATH=$PKG_CONFIG_PATH:/opt/homebrew/lib/pkgconfig:/opt/homebrew/opt/zlib/lib/pkgconfig
export LIBRARY_PATH="$(brew --prefix gcc)/lib/gcc/current:/opt/homebrew/opt/zlib/lib"
