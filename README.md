
<div align="center">

# .dotfiles


![GitHub last commit (branch)](https://img.shields.io/github/last-commit/memachado/.dotfiles/main?style=for-the-badge)
 ![GitHub repo size](https://img.shields.io/github/repo-size/memachado/.dotfiles?style=for-the-badge)

</div>

## Base system

* **OS**: Pop!_OS 22.04 LTS x86_64 
* **Kernel**: 6.5.6-76060506-generic 
* **Shell**: zsh 5.8.1 
* **DE**: GNOME 42.5 
* **WM**: Mutter 
* **WM** Theme: Pop 
* **Theme**: Pop-dark [GTK2/3] 
* **Icons**: breeze [GTK2/3] 
* **Terminal**: gnome-terminal 

Based on Pop!_OS this can be used on Debian, Ubuntu and other debian-like distros!

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