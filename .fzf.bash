# Setup fzf
# ---------
if [[ ! "$PATH" == */home/paco/.fzf/bin* ]]; then
  export PATH="$PATH:/home/paco/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/paco/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/paco/.fzf/shell/key-bindings.bash"

