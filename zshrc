# Initialize zsh completion system (must run before plugins that call compdef)
autoload -Uz compinit && compinit

# Plugin manager: antidote
source /opt/homebrew/opt/antidote/share/antidote/antidote.zsh
antidote load ~/.zsh_plugins.txt


# User configuration
DEFAULT_USER="chuck"

export NODE_ENV=development


# Set personal aliases
alias zshconfig="vi ~/.zshrc"
alias reload='source ~/.zshrc'
alias hosts='sudo vi /private/etc/hosts'
alias flushdns='sudo dscacheutil -flushcache'
alias sshkey='pbcopy < ~/.ssh/id_ed25519.pub'
alias updaterepos='ls | xargs -P10 -I{} git -C {} pull'
alias doupdates='antidote update && brew update && brew upgrade && brew cleanup && claude update'
alias ip='curl icanhazip.com | pbcopy'
alias shrug="echo '¯\_(ツ)_/¯' | pbcopy"
# lsd == brew install lsd
alias ls="lsd"
alias ll='lsd -la'
alias l='lsd -l'

export NVM_DIR="$HOME/.nvm"
  [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
  [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/chuck/.cache/lm-studio/bin"

# Added by Antigravity
export PATH="/Users/chuck/.antigravity/antigravity/bin:$PATH"
export PATH="/opt/homebrew/opt/node@24/bin:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="/opt/homebrew/opt/mysql-client/bin:$PATH"

# Starship prompt
eval "$(starship init zsh)"
