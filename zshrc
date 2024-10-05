ZSH_THEME="avit"

bindkey '^ ' autosuggest-accept

DISABLE_LS_COLORS="true"
COMPLETION_WAITING_DOTS="true"

# ==== fundamentals ====
# plugins=(git)

plugins=(zsh-autosuggestions)

# oh my zsh with auto suggestion
export ZSH="$HOME/.oh-my-zsh"
source $ZSH/oh-my-zsh.sh

ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=245'

export PATH=/opt/homebrew/bin:$PATH

# ==== searching ====
# autojump
plugins=(autojump)
[ -f $(brew --prefix)/etc/profile.d/autojump.sh ] && . $(brew --prefix)/etc/profile.d/autojump.sh

# fzf
plugins=(fzf)

# Example aliases
alias zshconfig="vim ~/.zshrc"
alias vimrcconfig="vim ~/.vimrc"
alias run_ctag="ctags -R *"

# for error
export LC_ALL=en_US.UTF-8

export EDITOR="/opt/homebrew/bin/vim"

source ~/.vim/gitshortcut.zsh
