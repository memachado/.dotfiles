#!/usr/bin/zsh


echo "Installing stow ..."

sudo apt install stow -y

echo "Create symlinks ..."

cd ~/.dotfiles

stow .