#!/usr/bin/zsh

backup_if() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        cp -r $1 ~/config_backup
    else
        echo "${1} not found!"
    fi
}

if [ ! -d ~/config_backup ]; then
    mkdir ~/config_backup
else
    echo "The directory '~/config_backup' already exists!"
fi

if [ -d ~/config_backup ]; then
    backup_if ~/.aliases
    backup_if ~/.fzf.zsh
    backup_if ~/.scripts
    backup_if ~/.fonts
    backup_if ~/.p10k.zsh
    backup_if ~/.ssh
    backup_if ~/.zshrc
fi


