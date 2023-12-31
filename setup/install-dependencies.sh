#!/usr/bin/bash

sudo nala update && sudo nala upgrade

sudo nala install curl vim stow exa flatpak gnome-software-plugin-flatpak btop gnome-tweaks synaptic vlc rsync neofetch dconf-cli zsh whiptail nala -y

sudo nala update && sudo nala upgrade

chsh -s $(which zsh)

#ubuntu-restricted-extras

echo "Do you want to install ubuntu-restricted-extras? [y/N]:"
read -r extras

if [[ $extras =~ ^[Yy]$ ]]; then
    sudo apt install ubuntu-restricted-extras -y
fi
