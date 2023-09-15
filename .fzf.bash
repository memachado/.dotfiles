# Setup fzf
# ---------
if [[ ! "$PATH" == */home/miguel/.fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/miguel/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/miguel/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/miguel/.fzf/shell/key-bindings.bash"
