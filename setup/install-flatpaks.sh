#!/usr/bin/bash

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

flatpak update -y

RESPONSES=$(whiptail --checklist "Flatpaks suggested apps" 20 100 10 \
"com.heroicgameslauncher.hgl" "Heroic Games" on \
"net.lutris.Lutris" "Lutris" off \
"org.keepassxc.KeePassXC" "KeePassXC" on \
"org.onlyoffice.desktopeditors" "OnlyOffice" on \
"org.qownnotes.QOwnNotes" "qownnotes" off \
"com.spotify.Client" "Spotify" on \
"com.discordapp.Discord" "Discord" off \
"org.gimp.GIMP" "Gimp2" off \
"io.dbeaver.DBeaverCommunity" "DBeaver" off \
"com.getpostman.Postman" "Postman" off \
3>&1 1>&2 2>&3)

RESPONSES=$(echo "$RESPONSES" | tr -d '"')

flatpak --user install flathub com.github.tchx84.Flatseal $RESPONSES