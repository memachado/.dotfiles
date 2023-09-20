#!/usr/bin/bash


apt install vim -y
apt install stow -y
apt install exa -y
apt install btop -y
apt install ubuntu-restricted-extras
apt install gnome-tweaks -y
apt install synaptic -y
apt install vlc -y
apt install rsync -y
apt install neofetch -y
apt install dconf-cli -y

sudo add-apt-repository ppa:mmozeiko/rclone-browser

apt install rclone-desktop -y
apt install rclone -y

# zsh
apt install zsh

# oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/djui/alias-tips.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting/alias-tips

git clone https://github.com/bhilburn/powerlevel9k.git ~/.oh-my-zsh/custom/themes/powerlevel9k


# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install