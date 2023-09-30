# Enable Powerlevel10k instant prompt. Should stay close to the top of $HOME/.zshrc.
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


# To customize prompt, run `p10k configure` or edit $HOME/.p10k.zsh.

source_if () {
    if [ -f "$1" ]; then
            source "$1"
    fi
}

source_if $ZSH/oh-my-zsh.sh

source_if $HOME/.p10k.zsh

source_if $HOME/.fzf.zsh

precmd() {
  source $HOME/.dotfiles/.aliases/.aliases.zsh
}

#? Choose the editor
editor() {
    if hash code 2>/dev/null; then
        export VISUAL="code --wait"
        export EDITOR="$VISUAL"
    elif hash vim 2>/dev/null; then
        export EDITOR="$VISUAL"
    else
        export EDITOR="$VISUAL"
    fi
}

editor

# The next line updates PATH for the Google Cloud SDK.
if [ -f '$HOME/google-cloud-sdk/path.zsh.inc' ]; then . '$HOME/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '$HOME/google-cloud-sdk/completion.zsh.inc' ]; then . '$HOME/google-cloud-sdk/completion.zsh.inc'; fi

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion