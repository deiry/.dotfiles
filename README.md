# .dotfiles

Personal macOS setup — zsh + Oh My Zsh + Starship + Neovim.

## What's included

| File | Description |
|---|---|
| `.zshrc` | Zsh config with Oh My Zsh, plugins and aliases |
| `.gitconfig` | Git identity config |
| `.gitconfig-work` | Work git identity (uncomment when ready) |
| `.ssh/config` | SSH routing for GitHub and Azure |
| `Brewfile` | All Homebrew packages and apps |
| `install.sh` | Bootstrap script for new machines |

## Install on a new machine

```bash
# 1. Clone
git clone git@github.com:deiry/.dotfiles.git ~/.dotfiles

# 2. Run
cd ~/.dotfiles && bash install.sh
```

## Zsh plugins

- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [fast-syntax-highlighting](https://github.com/zdharma-continuum/fast-syntax-highlighting)
- [zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete)

## Adding work account (Azure)

1. Generate SSH key: `ssh-keygen -t ed25519 -C "you@company.com" -f ~/.ssh/id_azure`
2. Uncomment Azure block in `.ssh/config`
3. Uncomment and fill `.gitconfig-work` with work email
4. Add public key to Azure DevOps

## Updating

```bash
git add .
git commit -m "your change"
git push
```
