# macos_configs

It's just beautiful to have all settings and configurations in a special .git repo. 😍

## Dependencies

```
install homebrew (see official docs)
install oh-my-zsh (see official docs)

brew install zsh
brew install tmux
brew install ranger
bew install zsh-syntax-highlighting
brew install zsh-autosuggestions
brew install fuck
```

## Other dependencies

Please see `.zshenv` for further dependencies like nvm etc. Adapt this file for your needs before using this configuration!

## Stow

Create symbolic links for config files.

### create stow-local-ignore

(macOS creates .DS_Store files for indexing (e.g. for use in Spotlight Search, Finder), and these will keep popping up in your folders. In order to circumvent this situation, we can use the file Stow uses to identify locally ignored files in order to avoid unexpected symlinks.)

```
brew install stow
cd ~
touch .stow-global-ignoredockerignore
echo "\.DS_Store" >> .stow-local-ignore
```

### create simlinks

CAUTION: before creating simlinks delete existing configuration files from your system!

#### 1. creating simlinks for all files in a dir to home directory e.g. for .zsh

```
[macos_configs] cd .dotfiles/.zsh
[.zsh] stow -v --target=$HOME .
LINK: .zlogin => src/personal/macos_configs/.dotfiles/.zsh/.zlogin
LINK: .zprofile => src/personal/macos_configs/.dotfiles/.zsh/.zprofile
LINK: .zshenv => src/personal/macos_configs/.dotfiles/.zsh/.zshenv
LINK: .zshrc => src/personal/macos_configs/.dotfiles/.zsh/.zshrc
```

Note: ls -a will show simlinks a normal list-item. in finder it's described as "alias" and _not_ as "document"

#### 2. create simlinks for all files in a dir to specifc dir (e.g. for vscode settings)

```
[macos_configs] cd .dotfiles/settings/vscode
[vscode] stow -v --target="$HOME/Library/Application Support/Code/User" .
LINK: keybindings.json => ../../../../src/personal/macos_configs/settings/vscode/keybindings.json
LINK: settings.json => ../../../../src/personal/macos_configs/settings/vscode/settings.json
```

## zsh config files

.zprofile
.zlogin and .zprofile are basically the same thing - they set the environment for login shells; they just get loaded at different times. .zprofile is based on the Bash's .bash_profile while .zlogin is a derivative of CSH's .login. Since Bash was the default shell for everything up to Mojave, stick with .zprofile.

.zshrc
This sets the environment for interactive shells. This gets loaded after .zprofile. It's typically a place where you "set it and forget it" type of parameters like $PATH, $PROMPT, aliases, and functions you would like to have in both login and interactive shells.

.zshenv (Optional)
This is read first and read every time. This is where you set environment variables. I say this is optional because is geared more toward advanced users where having your $PATH, $PAGER, or $EDITOR variables may be important for things like scripts that get called by launchd. Those run under a non-interactive shell so anything in .zprofile or .zshrc won't get loaded.

.zlogout (Optional)
But very useful! This is read when you log out of a session and is very good for cleaning things up when you leave (like resetting the Terminal Window Title).

## Bonus tips

- vscode settings path on macOS: `cd ~/Library/Application\ Support/Code/User`
- see `.zshenv`for useful zsh commands (aliases)
