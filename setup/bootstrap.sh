#!/usr/bin/bash

execute_if() {
    if [ -f "$1" ]; then

        echo "Do you want to execute $1? [y/N]:"
        read -r choice

        if [[ $choice =~ ^[Yy]$ ]]; then
            . $1
        fi
    fi
}

execute_if $HOME/.dotfiles/backup.sh
execute_if $HOME/.dotfiles/install-dependencies.sh
execute_if $HOME/.dotfiles/install-oh-my-zsh.sh
execute_if $HOME/.dotfiles/install-flatpaks.sh

echo "Checking if stow is installed ..."

if ! command -v stow &>/dev/null; then
    echo "stow is not installed. Installing stow ..."
    sudo apt install stow -y
else
    echo "stow is already installed."
    cd $HOME/.dotfiles

    stow .
fi

echo "Checking if fc-cache is installed ..."

if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f -v
fi

gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/.wallpapers/wallpaper-01.jpg"
