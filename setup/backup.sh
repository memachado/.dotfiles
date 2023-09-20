#!/usr/bin/zsh

if [ ! -d ~/config_backup ]; then
    mkdir ~/config_backup
else
    echo "The directory '~/config_backup' already exists!"
fi

if [ -d ~/backup_config ]; then
    backup_if ~/.aliases
    backup_if ~/.fzf.zsh
    backup_if ~/.scripts
    backup_if ~/.fonts
    backup_if ~/.p10k.zsh
    backup_if ~/.ssh
    backup_if ~/.zshrc
fi

backup_if() {
    if [ -d "$1" ]; then
        cp -r $1 ~/backup_config
    else
        echo "${1} not found!"
    fi
}

