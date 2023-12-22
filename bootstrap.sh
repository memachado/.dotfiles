#!/usr/bin/bash

# TODO

# include distinction between before and after reboot 

# https://unix.stackexchange.com/questions/145294/how-to-continue-a-script-after-it-reboots-the-machine

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
execute_if $HOME/.dotfiles/setup/config-extra.sh

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
