# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"
export EDITOR="nvim"
export TERM="xterm-256color"

plugins=(git sudo)

source $ZSH/oh-my-zsh.sh
ZSH_THEME=""
eval "$(starship init zsh)"

#Aliases
alias sl="exa --icons --sort type"
alias ls="exa --icons --sort type"
alias ll="exa --icons --long --sort type"
alias l="exa --icons --long --sort type"
alias tree="exa --icons --git -a --tree -s type -I '.git|node_modules|bower_components'"
alias e=exit
alias c=clear
alias n=nvim



#Env Variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml
source ~/.env_variables



