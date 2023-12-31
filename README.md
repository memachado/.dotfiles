
<div align="center">

# .dotfiles


![GitHub last commit (branch)](https://img.shields.io/github/last-commit/memachado/.dotfiles/main?style=for-the-badge)
 ![GitHub repo size](https://img.shields.io/github/repo-size/memachado/.dotfiles?style=for-the-badge)

</div>

## System

Created over **Pop!_OS 22.04 LTS x86_64**, used also on **Ubuntu 22.04.3 LTS x86_64**

## Installation

Assisted installation, meaning you still have to confirm most changes!

``` shell
# download dotfiles
git clone https://github.com/memachado/.dotfiles.git


# run bootsrap
bash $HOME/.dotfiles/setup/bootstrap.sh

```

## Gnome Terminal

```
# export
dconf dump /org/gnome/terminal/ > ./gnome-terminal.properties

# import 
# already in the bootstrap
cat ./gnome-terminal.properties | dconf load /org/gnome/terminal/

```

<div align="center">

<hr />

*Remember – hate is always foolish…and love, is always wise.*

</div>

## References

* [PROxZIMA/.dotfiles](https://github.com/PROxZIMA/.dotfiles)
* [JaKooLit/Hyprland-Dots](https://github.com/JaKooLit/Hyprland-Dots)