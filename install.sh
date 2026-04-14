#!/usr/bin/env bash
set -e

echo "🚀 Installing dotfiles..."

# Homebrew
if ! command -v brew &>/dev/null; then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
brew bundle --file=./Brewfile

# Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
  sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

# Zsh plugins
ZSH_CUSTOM="${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}"

clone_plugin() {
  local name=$1
  local url=$2
  local dir="$ZSH_CUSTOM/plugins/$name"
  [ ! -d "$dir" ] && git clone --depth=1 "$url" "$dir"
}

clone_plugin "zsh-autosuggestions" "https://github.com/zsh-users/zsh-autosuggestions"
clone_plugin "zsh-syntax-highlighting" "https://github.com/zsh-users/zsh-syntax-highlighting"
clone_plugin "fast-syntax-highlighting" "https://github.com/zdharma-continuum/fast-syntax-highlighting"
clone_plugin "zsh-autocomplete" "https://github.com/marlonrichert/zsh-autocomplete"


# SSH config
mkdir -p ~/.ssh
[ ! -f ~/.ssh/config ] && ln -sf ~/.dotfiles/.ssh/config ~/.ssh/config
chmod 700 ~/.ssh
chmod 600 ~/.ssh/config 2>/dev/null || true

# Symlinks
ln -sf ~/.dotfiles/.zshrc ~/.zshrc
ln -sf ~/.dotfiles/.gitconfig ~/.gitconfig
ln -sf ~/.dotfiles/.gitconfig-work ~/.gitconfig-work

echo "✅ Done! Run: source ~/.zshrc"
