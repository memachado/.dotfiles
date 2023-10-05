#!/usr/bin/zsh

today=$(date +%Y-%m-%d)

backup_if() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        cp -r $1 $HOME/config_backup_$today
    else
        echo "${1} not found!"
    fi
}

if [ ! -d $HOME/config_backup_$today ]; then
    mkdir $HOME/config_backup_$today
else
    echo "The directory '$HOME/config_backup_$today' already exists!"
fi

if [ -d $HOME/config_backup_$today ]; then
    
    # system folders
    backup_if $HOME/Pictures/Wallpapers
    backup_if $HOME/.local/share/fonts
    
    # dotfiles folders
    backup_if $HOME/.aliases
    backup_if $HOME/.scripts

    # dotfiles files    
    backup_if $HOME/.p10k.zsh
    backup_if $HOME/.fzf.zsh
    backup_if $HOME/.zshrc
fi


