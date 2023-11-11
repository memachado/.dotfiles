#!/usr/bin/bash

sudo apt update -y && sudo apt upgrade -y

sudo apt install curl vim stow exa btop gnome-tweaks synaptic vlc rsync neofetch dconf-cli zsh -y

sudo apt update -y && sudo apt upgrade -y

chsh -s $(which zsh)

#ubuntu-restricted-extras

echo "Do you want to install ubuntu-restricted-extras? [y/N]:"
read -r extras

if [[ $extras =~ ^[Yy]$ ]]; then
    sudo apt install ubuntu-restricted-extras -y
fi
