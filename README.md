# .dotfiles
My personal linux enviroment configuration.

## Installation

Assisted installation, meaning you still have to confirm most of changes!

``` shell
# download dotfiles
git clone https://github.com/memachado/.dotfiles.git


# install dependencies
bash $HOME/.dotfiles/setup/install-dependencies.sh

```

## Gnome Terminal

```
# export
dconf dump /org/gnome/terminal/ > ./gnome-terminal.properties

# import 
cat ./gnome-terminal.properties | dconf load /org/gnome/terminal/

```

## GDrive

``` shell
cp $HOME/.dotfiles/.services/google-drive-mount.service /etc/systemd/system/google-drive-mount.service

sudo systemctl start google-drive-mount.service

sudo systemctl enable google-drive-mount.service

```