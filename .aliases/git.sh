#!/usr/bin/zsh

# Git
alias grt='gerrit'
alias check='git checkout ${1}'
alias cbm='git checkout master'
alias cbd='git checkout develop'
alias amend='git commit --amend'
alias st='git status'
alias sts='st -s'
alias pull='git pull'
alias add='add'
alias tag='git tag'
alias gmm='git merge master'
alias gmd='git merge develop'
alias gmc='git merge --continue'
alias cmt='git commit -m ${*}'
alias last='log'
alias fet='git fetch'
alias rst='git reset --soft HEAD~1'
alias rhm='git reset --hard origin/master'
alias lcg='git log --all --graph --decorate --oneline --abbrev-commit'

# GitHub Feature Branch Workflow
alias gnf='gnf'
alias gnb='gnb'

function gnf() {
    if [ "$#" -eq 0 ] || [ "$#" -gt 1 ]; then
        echo "Invalid number of arguments. Please pass exactly one argument to create the branch."
    else
        git checkout -b feature-"${1}"
    fi
}

function gnb() {
    if [ "$#" -eq 0 ] || [ "$#" -gt 1 ]; then
        echo "Invalid number of arguments. Please pass exactly one argument to create the branch."
    else
        git checkout -b bug-"${1}"
    fi
}

function add () {
    if [[ -z ${1} ]]
    then 
        git add .
    else
        git add "${1}"
    fi
}

function log () {
    if [[ -z ${1} ]]
    then 
        git log -1
    else
        git log -"${1}"
    fi
}

function gerrit () {
    if [[ -z ${1} ]]
    then 
        ramo=$(git branch | grep -oP '(?<=\* ).+')
    else
        ramo=${1}
    fi
    
    git push origin HEAD:refs/for/${ramo}
}