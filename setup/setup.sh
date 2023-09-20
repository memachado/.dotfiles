#!/usr/bin/bash


echo "Installing stow ..."

sudo apt install stow -y

echo "Create symlinks ..."

cd ~/.dotfiles

stow .

cd ~/.fonts

fc-cache -f -v
