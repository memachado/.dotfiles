execute_if_exists () {
    if [ -f "$1" ]; then
            . "$1"
    fi
}

execute_if_exists ~/.dotfiles/.aliases/general.sh
execute_if_exists ~/.dotfiles/.aliases/git.sh
execute_if_exists ~/.dotfiles/.aliases/construshop.sh
