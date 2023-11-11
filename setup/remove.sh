#!/usr/bin/zsh

today=$(date +%Y-%m-%d)

move_if() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        mv $1 $HOME/config_moved_$today
    else
        echo "${1} not found!"
    fi
}

if [ ! -d $HOME/config_backup_$today ]; then
    mkdir $HOME/config_moved_$today
else
    echo "The directory '$HOME/config_moved_$today' already exists!"
fi

if [ -d $HOME/config_moved_$today ]; then
    
    # system folders
    #backup_if $HOME/Pictures/Wallpapers
    #backup_if $HOME/.local/share/fonts
    
    # dotfiles folders
    #backup_if $HOME/.aliases
    #backup_if $HOME/.scripts

    # dotfiles files    
    move_if $HOME/.p10k.zsh
    move_if $HOME/.fzf.zsh
    move_if $HOME/.zshrc
fi


