export EDITOR="nvim"
export TERM="xterm-256color"


ZSH_THEME=""

#Plugin config
bindkey '^ ' autosuggest-accept
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
source ~/.aliases
source ~/.extra

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"
