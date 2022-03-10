#!/bin/bash


# Use bash-completion, if available
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
    . /usr/share/bash-completion/bash_completion

#Aliases
source ~/.aliases

#Env variables
export EDITOR="nvim"
source ~/.env_variables

#System specific config
source ~/.extra
