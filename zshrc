ZSH_THEME="avit"

bindkey '^ ' autosuggest-accept

DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

plugins=(fzf)
plugins=(zsh-autosuggestions)

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimrcconfig="vim ~/.vimrc"
alias run_ctag="ctags -R *"

# for error
export LC_ALL=en_US.UTF-8

source ~/.vim/gitshortcut.zsh
