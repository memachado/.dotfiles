#!/usr/bin/zsh

backup_if() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        cp -r $1 $HOME/config_backup
    else
        echo "${1} not found!"
    fi
}

if [ ! -d $HOME/config_backup ]; then
    mkdir $HOME/config_backup
else
    echo "The directory '$HOME/config_backup' already exists!"
fi

if [ -d $HOME/config_backup ]; then
    backup_if $HOME/.aliases
    backup_if $HOME/.fzf.zsh
    backup_if $HOME/.scripts
    backup_if $HOME/.fonts
    backup_if $HOME/.p10k.zsh
    backup_if $HOME/.ssh
    backup_if $HOME/.zshrc
fi


