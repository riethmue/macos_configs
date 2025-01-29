# Configure Homebrew environment by setting paths (e.g., PATH, MANPATH, INFOPATH)
# so Homebrew and its installed tools work properly in the shell.
eval "$(/opt/homebrew/bin/brew shellenv)"
# configuration
# HINT: use command macos_configs_reset for new configuration
if [[ ! -f "$HOME/.macos_configs_initalized" ]]; then
    # greeting
    echo "Hi, $USER!"
    echo "You got a really beautiful configuration 💻✨"
    echo "Hacker Mode: Activated 🦾"
    echo "Made with ♥ by https://github.com/riethmue"
    echo "Starting your macOS configuration... 🚀"
    echo "If you ever want to restart the configuration, use command: macos_configs_reset"

    # automatically start ssh agent and add all private keys ONCE
    # HINT: password needs to be inserted if your .ssh contains any password protected keys
    # if SSH_AGENT_PID is not in PATH and this command leads into unsuccessful ssh agent kill use and start a new terminal:
    # [macos_configs] kill <agent-id>
    echo "Adding your SSH private keys to the SSH agent..."
    echo "If any keys are password-protected, you will be prompted to enter your password."
    echo "If a key cannot be added now, you can add it manually later with the command: ssh-add <key-file>"

    echo "Killing any running SSH agents to ensure a clean start..."
    pkill -u "$USER" ssh-agent

    # Start SSH agent if it's not already running
    if ! pgrep -u "$USER" ssh-agent > /dev/null; then
        eval "$(ssh-agent -s)" > /dev/null
        export SSH_AUTH_SOCK
        export SSH_AGENT_PID
    fi

    # Check if SSH_AUTH_SOCK is set, indicating the agent is running
    if [[ -z "$SSH_AUTH_SOCK" ]]; then
        echo "Error: SSH agent is not running. Please try again or restart your terminal."
        return 1
    fi

    # Add all SSH private keys
    for key in ~/.ssh/*; do
        if [[ -f "$key" && "$key" != *.pub ]]; then
            ssh-add "$key" > /dev/null 2>&1
        fi
    done

    # Mark the configuration as initialized
    touch ~/.macos_configs_initalized
    echo "Configuration has been initialized."
fi
