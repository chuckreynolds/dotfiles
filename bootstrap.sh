#!/usr/bin/env bash
# Bootstrap a new macOS machine with Chuck's shell setup.
# Run once from a fresh clone of this repo:
#   ./bootstrap.sh

set -euo pipefail

DOTFILES="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TS="$(date +%Y%m%d-%H%M%S)"

echo "==> Dotfiles source: $DOTFILES"

# 1. Homebrew
if ! command -v brew >/dev/null 2>&1; then
  echo "==> Installing Homebrew"
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  # Add brew to PATH for the rest of this script (Apple Silicon)
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "==> Homebrew already installed"
fi

# 2. Install everything from Brewfile
echo "==> Running brew bundle (this takes a while)"
brew bundle --file="$DOTFILES/Brewfile"

# 3. Symlink zshrc and zsh_plugins.txt into $HOME, backing up any existing files
link_file() {
  local src="$1" dest="$2"
  if [ -e "$dest" ] && [ ! -L "$dest" ]; then
    echo "==> Backing up existing $dest -> $dest.backup-$TS"
    mv "$dest" "$dest.backup-$TS"
  elif [ -L "$dest" ]; then
    rm "$dest"
  fi
  ln -s "$src" "$dest"
  echo "==> Linked $dest -> $src"
}

link_file "$DOTFILES/zshrc" "$HOME/.zshrc"
link_file "$DOTFILES/zsh_plugins.txt" "$HOME/.zsh_plugins.txt"

echo ""
echo "==> Done. Open a new terminal window."
echo "    First shell start will clone antidote plugins (~10-20s)."
