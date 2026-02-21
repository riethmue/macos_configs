# macOS Configs 🍎

> My personal macOS development environment configurations managed with Git and GNU Stow

Keep my dotfiles, editor settings, and shell configurations organized, versioned, and easily deployable across machines.

## 📦 What's Included

- **Shell Configuration**: zsh with oh-my-zsh, custom aliases, and plugins
- **Terminal Multiplexer**: tmux configuration
- **File Manager**: ranger configuration
- **Editor Settings**: VS Code settings and keybindings

## 🚀 Quick Start

### Prerequisites

First, install Homebrew and oh-my-zsh:

```bash
# Install Homebrew (see https://brew.sh)
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

# Install oh-my-zsh (see https://ohmyz.sh)
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### Install Dependencies

```bash
brew install zsh
brew install tmux
brew install ranger
brew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install thefuck
brew install stow
brew install direnv
```

### Additional Dependencies

⚠️ **Important**: Review `.zshenv` for additional dependencies like `nvm`, `node`, etc. Adapt this file to your needs before using this configuration!

## 🔗 Setting Up Symlinks with Stow

GNU Stow creates symlinks from this repository to their target locations, making it easy to manage your configs in one place.

### 1. Prepare Stow

macOS creates `.DS_Store` files that can interfere with stow. Create a global ignore file:

```bash
cd ~
touch .stow-local-ignore
echo "\.DS_Store" >> .stow-local-ignore
```

### 2. Create Symlinks

⚠️ **CAUTION**: Backup and delete existing configuration files before creating symlinks!

#### Zsh Configuration

```bash
cd /path/to/macos_configs/.dotfiles/.zsh
stow -v --target=$HOME .
```

Expected output:

```
LINK: .zlogin => src/personal/macos_configs/.dotfiles/.zsh/.zlogin
LINK: .zprofile => src/personal/macos_configs/.dotfiles/.zsh/.zprofile
LINK: .zshenv => src/personal/macos_configs/.dotfiles/.zsh/.zshenv
LINK: .zshrc => src/personal/macos_configs/.dotfiles/.zsh/.zshrc
```

#### VS Code Settings

```bash
cd /path/to/macos_configs/settings/vscode
stow -v --target="$HOME/Library/Application Support/Code/User" .
```

Expected output:

```
LINK: keybindings.json => ../../../../src/personal/macos_configs/settings/vscode/keybindings.json
LINK: settings.json => ../../../../src/personal/macos_configs/settings/vscode/settings.json
```

> **Note**: Symlinks appear as normal files with `ls -a`. In Finder, they're labeled as "alias" rather than "document".

## 📚 Understanding Zsh Config Files

### `.zprofile`

Sets the environment for login shells. Based on Bash's `.bash_profile`. This is the recommended file to use since Bash was the default shell up to macOS Mojave.

### `.zshrc`

Loaded after `.zprofile` for interactive shells. The primary location for `$PATH`, `$PROMPT`, aliases, and functions you want available in both login and interactive shells.

### `.zshenv` (Optional)

Read first and on every shell invocation. Use for environment variables needed by non-interactive shells (e.g., scripts called by `launchd`). Important for advanced users who need `$PATH`, `$PAGER`, or `$EDITOR` in all contexts.

### `.zlogout` (Optional)

Executed when logging out of a session. Useful for cleanup tasks like resetting the terminal window title.

## 💡 Tips & Tricks

- **VS Code settings location**: `~/Library/Application Support/Code/User`
- **Custom aliases**: Check `.zshenv` for useful zsh commands and aliases
- **Updating configs**: Edit files in this repo, changes are reflected immediately via symlinks
- **New machine setup**: Clone this repo and run the stow commands above
