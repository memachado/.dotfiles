#!/usr/bin/bash

# Check if running as root. If root, script will exit
if [[ $EUID -eq 0 ]]; then
    echo "This script should not be executed as root! Exiting..."
    exit 1
fi

execute_if() {
    if [ -f "$1" ]; then

        echo "Do you want to execute $1? [y/N]:"
        read -r choice

        if [[ $choice =~ ^[Yy]$ ]]; then
            . $1
        fi
    else
        echo "$1 not found!"
    fi
}

execute_if $HOME/.dotfiles/setup/install-dependencies.sh
execute_if $HOME/.dotfiles/setup/backup.sh
execute_if $HOME/.dotfiles/setup/install-oh-my-zsh.sh
execute_if $HOME/.dotfiles/setup/install-flatpaks.sh
execute_if $HOME/.dotfiles/setup/remove.sh

echo "Checking if stow is installed ..."

if ! command -v stow &>/dev/null; then
    echo "stow is not installed. Installing stow ..."
    sudo apt install stow -y
else
    echo "stow is already installed."
    cd $HOME/.dotfiles

    if [ "$(pwd)" = "$HOME/.dotfiles" ]; then
        stow .
    else
        echo "Please run this script from the $HOME/.dotfiles directory."
        exit 0
    fi
fi

echo "Checking if fc-cache is installed ..."

if command -v fc-cache >/dev/null 2>&1; then
    fc-cache -f -v
fi

echo "Do you want to change the wallpaper? [y/N]:"
read -r wallpaper

if [[ $wallpaper =~ ^[Yy]$ ]]; then
    gsettings set org.gnome.desktop.background picture-uri-dark "file://$HOME/Pictures/Wallpapers/wallpaper-01.jpg"
fi

echo "Do you want to change the terminal settings? [y/N]:"
read -r terminal

if [[ $terminal =~ ^[Yy]$ ]]; then
    cat ./gnome-terminal.properties | dconf load /org/gnome/terminal/
fi

echo "Do you want to generate a new ssh key? [y/N]:"
read -r sshkey

if [[ $sshkey =~ ^[Yy]$ ]]; then

    echo "Please enter your email address:"
    read -r email

    ssh-keygen -t ed25519 -C "$email" -q -f ~/.ssh/id_ed25519 -N ""

fi

echo "Do you want to configure git global config? [y/N]:"
read -r gitid

if [[ $gitid =~ ^[Yy]$ ]]; then

    echo "Please enter your email address for global config:"
    read -r gitemail

    echo "Please enter your name:"
    read -r name

    git config --global user.email "$gitemail"
    git config --global user.name "$name"
fi

function add_remote_debugging_port() {
    file="$1"

    if [ -f "$file" ]; then
        sed -i '/^Exec=/ {/ --remote-debugging-port=9222/! s/$/ --remote-debugging-port=9222/}' "$file"
        echo "Remote debugging port added to the lines starting with 'Exec=' in $file"
    else
        echo "$file not found!"
    fi
}

echo "Do you want to configure chrome debugging? [y/N]:"
read -r debugging

if [[ $gitid =~ ^[Yy]$ ]]; then

    add_remote_debugging_port

fi
