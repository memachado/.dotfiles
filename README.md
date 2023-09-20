# .dotfiles
My personal linux enviroment configuration.

## Installation

``` shell
# download dotfiles
git clone https://github.com/memachado/.dotfiles.git


# install dependencies
bash ~/.dotfiles/setup/install-dependencies.sh

```

## Gnome Terminal

```
# export
dconf dump /org/gnome/terminal/ > ./gnome-terminal.properties

# import 
cat ./gnome-terminal.properties | dconf load /org/gnome/terminal/

```