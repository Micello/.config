#start tmux
if command -v tmux &> /dev/null && [ -z "$TMUX" ]; then
  tmux attach-session -t default || tmux  new-session -s default
fi
#Zsh completion system
autoload -U compinit; compinit
_comp_options+=(globdots) # With hidden files
source "$ZDOTDIR/completion.zsh"
source "$ZDOTDIR/zsh-autosuggestions/zsh-autosuggestions.zsh"
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz my_prompt; my_prompt

setopt AUTO_PUSHD           # Push the current directory visited on the stack.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

export PATH=$PATH:/usr/local/go/bin
export PATH="$PATH:/opt/nvim-linux64/bin"
export FZF_DEFAULT_COMMAND="find . -type f"
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source "$ZDOTDIR/aliases"

setopt inc_append_history
setopt share_history

bindkey -r '^S'
stty stop undef
stty start undef
bindkey -r '^V'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
