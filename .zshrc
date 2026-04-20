unsetopt WARN_CREATE_GLOBAL
# Path to Oh My Zsh
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  fast-syntax-highlighting
  zsh-autocomplete
)

source $ZSH/oh-my-zsh.sh

# Starship prompt
export PATH="$HOME/.local/bin:$PATH"
# Python PATH
export PATH="$HOME/Library/Python/3.9/bin:$PATH"
eval "$(starship init zsh)"
export UV_PYTHON=python3.11
export UV_PROJECT_ENVIRONMENT=.venv

# Zoxide (smarter cd)
eval "$(zoxide init zsh)"

# FZF (fuzzy finder)
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Colors
export TERM=xterm-256color

# Editor
alias vi='nvim'
alias vim='nvim'

# Better ls
alias ls='eza --icons'
alias ll='eza -la --icons'
alias la='eza -a --icons'

# Better cat
alias cat='bat'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ~='cd ~'

# Git shortcuts
alias gs='git status'
alias gp='git push'
alias gl='git log --oneline --graph'
alias ga='git add .'
alias gc='git commit -m'
alias gco='git checkout'


# Dotfiles quick edit
alias dotfiles='cd ~/.dotfiles'
alias zshrc='nvim ~/.dotfiles/.zshrc'

alias python='python3'
alias pip='pip3'
alias venv='source .venv/bin/activate'

# Jupyter kernels
alias kernel-list='jupyter kernelspec list'
alias kernel-remove='jupyter kernelspec remove'
alias kernel-add='python -m ipykernel install --user --name'
