#!/usr/bin/zsh
# ZSH Version

red='\033[31m'
gre='\033[32m'
blu='\033[36m'
end='\e[0m'

# General
alias src='source ~/.zshrc'
alias al="listAlises"
alias als="al | grep ${*}"

# .myconfigs
alias cfg='/usr/bin/git --git-dir=$HOME/.myconfigs/ --work-tree=$HOME'
alias ka='cfg add'
alias kau='cfg add -u'
alias kd='cfg diff'
alias kc="cfg commit -m ${*}"
alias kps='cfg push'
alias kpl='cfg pull'
alias kr='cfg reset'
alias kl='cfg log'
alias ks='cfg status -s'
alias kw='cfg show'
alias kff='configFastForward'

alias drc="sudo docker-compose ${*}"

alias ls="exa --icons -b ${*}"


# Functions

function configFastForward () {
    kau
    kc "Update ${*}"
    kps
}


function listAlises() {
    while read -r line
    do
        help=$(echo $line | grep -oP '(?<==).+')
        alias=$(echo $line | grep -oP '(?<=^alias ).+?(?==)')
        [[ -n ${alias} ]] && echo -e "${gre}${alias} ${end}- ${blu}${help:-}${end}"
    done < ~/.my_zsh_aliases.sh
}
