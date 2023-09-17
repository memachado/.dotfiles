# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    alias-tips
    fzf
)


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.

source_if () {
    if [ -f "$1" ]; then
            source "$1"
    fi
}

source_if $ZSH/oh-my-zsh.sh

source_if ~/.p10k.zsh

source_if ~/.fzf.zsh

precmd() {
  source ~/.dotfiles/.aliases/.aliases.zsh
}