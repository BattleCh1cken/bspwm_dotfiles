# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  # source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
# fi

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
setopt COMPLETE_IN_WOR

source ~/.aliases
source ~/.extra
#Env Variables
source ~/.env_variables


#Plugins
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2>/dev/null
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2>/dev/null
source /usr/share/autojump/autojump.zsh 2>/dev/null
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme 2>/dev/null
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh 2>/dev/null


#Plugin config
bindkey '^ ' autosuggest-accept
# Init Starship
eval "$(starship init zsh)" 
# Setup Starship custom prompt
export STARSHIP_CONFIG=$HOME/.config/starship/starship.toml
