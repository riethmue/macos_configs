# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# homebrew
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"

# manpages
export MANPATH="/usr/local/man:$MANPATH"

# cargo
[ -f "$HOME/.cargo/env" ] && . "$HOME/.cargo/env"

# miniconda
export PATH="$HOME/miniconda3/bin:$PATH"

# bun
export PATH="$HOME/.bun/bin:$PATH"

# adb
export PATH="/opt/homebrew/bin:$PATH"

# `VISUAL` sets the visual editor. This will be preferred by programs that require a graphical editor, like VS Code.
# `--wait` makes VS Code wait until the editor is closed before returning control to the terminal.

# `EDITOR` sets the default text-based editor. This is used for terminal-based text editing, such as when editing Git commit messages or crontab entries.

if command -v code >/dev/null 2>&1; then
  export VISUAL="code --wait"
  export EDITOR="code --wait"
else
  # export EDITOR="vim"
fi


# You may need to manually set your language environment
# export LANG=en_US.UTF-8
