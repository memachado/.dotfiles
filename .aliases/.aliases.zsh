execute_if () {
    if [ -f "$1" ]; then
            . $1
    fi
}

execute_if ~/.dotfiles/.aliases/general.sh
execute_if ~/.dotfiles/.aliases/git.sh
execute_if ~/.dotfiles/.aliases/construshop.sh
