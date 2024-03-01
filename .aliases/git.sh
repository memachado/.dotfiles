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

alias last='log'
alias fet='git fetch'
alias rst='git reset --soft HEAD~1'
alias rhm='git reset --hard origin/master'
alias lcg='git log --all --graph --decorate --oneline --abbrev-commit'

# GitHub Feature Branch Workflow
alias gnf='gnf'
alias gnb='gnb'
alias push='git push -u origin "$(git rev-parse --abbrev-ref HEAD)"'
alias cmt='cmt'

alias check-branchs='check-branchs'

function cmt() {
    if [ $# -lt 1 ]; then
        echo "Usage: cmt \"title message\" [description text]"
        return 1
    fi
    title_message=$1
    description_text=$2
    if [ -z "$description_text" ]; then
        git commit -m $title_message
    else
        git commit -m $title_message -m $description_text
    fi
}

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


function check-branchs () {
    for branch in $(git branch | cut -c 3-); do
        if ! git ls-remote --exit-code origin "$branch" &> /dev/null; then
            echo "Branch $branch does not exist on the remote server."
            echo "Do you want to delete it? [y/N]:"
            read -r deletebranch

            if [[ $deletebranch =~ ^[Yy]$ ]]; then

                git branch --delete $branch

            fi
        fi
    done
}
