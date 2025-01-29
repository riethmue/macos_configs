# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# homebrew
PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# manpages
export MANPATH="/usr/local/man:$MANPATH"

# cargo
. "$HOME/.cargo/env"

# miniconda
export PATH="$HOME/miniconda3/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Preferred editor for local and remote sessions
export EDITOR="code"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8
