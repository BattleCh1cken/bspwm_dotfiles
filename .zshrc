export EDITOR="nvim"
export TERM="xterm-256color"

# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.cache/zshhistory
setopt appendhistory


source ~/.aliases
source ~/.extra
#Env Variables
export STARSHIP_CONFIG=~/.config/starship/starship.toml
source ~/.env_variables


#Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null

eval "$(starship init zsh)"

#Plugin config
bindkey '^ ' autosuggest-accept
