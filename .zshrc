export PATH="$HOME/.local/bin:$HOME/.cargo/bin:$PATH"
export EDITOR="nvim"
export SUDO_EDITOR="nvim"
export VISUAL="nvim"

export BROWSER="firefox"

export LANG=en_US.UTF-8




# History in cache directory:
HISTSIZE=10000
SAVEHIST=10000``
HISTFILE=~/.cache/zshhistory
setopt appendhistory


#Completion
ENABLE_CORRECTION="true"


setopt CORRECT
setopt NO_NOMATCH
setopt LIST_PACKED
setopt ALWAYS_TO_END
setopt GLOB_COMPLETE
setopt COMPLETE_ALIASES
setopt COMPLETE_IN_WORD

source ~/.aliases
source ~/.extra
#Env Variables


#Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null

#Plugin config
bindkey '^ ' autosuggest-accept
# Init Starship
eval "$(zoxide init zsh)"
eval "$(starship init zsh)" 
# Setup Starship custom prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
