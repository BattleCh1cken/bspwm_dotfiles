export EDITOR="nvim"
export TERM="xterm-256color"


ZSH_THEME=""

#Plugin config
bindkey '^ ' autosuggest-accept


source ~/.aliases
source ~/.extra
#Env Variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml
source ~/.env_variables

source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null

eval "$(starship init zsh)"
