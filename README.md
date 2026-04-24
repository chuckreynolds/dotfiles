# dotfiles

My macOS shell setup: zsh + antidote + Starship, plus the Homebrew packages I rely on.

## Stack

- **zsh** (default macOS shell)
- **antidote** — fast zsh plugin manager (replaces Oh My Zsh + Antigen)
- **Starship** — cross-shell prompt
- **lsd** — modern `ls` replacement
- **nvm** + `node@24` — Node version management
- Plugins: OMZ `git` / `macos` / `dotenv`, plus `zsh-completions`, `zsh-autosuggestions`, `zsh-syntax-highlighting`

## Files

| File | Symlinked to | Purpose |
|------|--------------|---------|
| `zshrc` | `~/.zshrc` | Main shell config |
| `zsh_plugins.txt` | `~/.zsh_plugins.txt` | Antidote plugin list |
| `Brewfile` | — | Homebrew packages (generated via `brew bundle dump`) |
| `bootstrap.sh` | — | One-shot setup script for a new machine |

## New machine setup

```sh
cd ~/dev
git clone https://github.com/chuckreynolds/dotfiles.git
cd dotfiles
./bootstrap.sh
```

Then open a new terminal window. First launch clones all antidote plugins (~10–20s); subsequent launches are fast.

## Updating this repo from the live config

After `bootstrap.sh` runs, `~/.zshrc` and `~/.zsh_plugins.txt` are symlinks into this repo — any edits you make are already tracked. Just `git commit` and push.

If those files are regular copies instead of symlinks (e.g. you set them up manually before adopting this repo), sync with:

```sh
cp ~/.zshrc ~/dev/dotfiles/zshrc
cp ~/.zsh_plugins.txt ~/dev/dotfiles/zsh_plugins.txt
```

To refresh the Brewfile after installing new packages:

```sh
brew bundle dump --file=~/dev/dotfiles/Brewfile --force
```

## Handy aliases (defined in `zshrc`)

- `reload` — source `~/.zshrc`
- `doupdates` — run `antidote update && brew update && brew upgrade && brew cleanup && claude update`
- `updaterepos` — `git pull` every repo in the current directory (parallel)
- `zshconfig` — open `~/.zshrc` in vi
- `ip` — copy current public IP to clipboard
- `sshkey` — copy `~/.ssh/id_ed25519.pub` to clipboard
- `flushdns` — flush macOS DNS cache
- `ls` / `ll` / `l` — `lsd` variants
