execute_if () {
    if [ -f "$1" ]; then
            . $1
    fi
}

execute_if $HOME/.dotfiles/.aliases/general.sh
execute_if $HOME/.dotfiles/.aliases/git.sh
execute_if $HOME/.dotfiles/.aliases/construshop.sh
