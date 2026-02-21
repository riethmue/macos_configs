# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="wedisagree"

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
COMPLETION_WAITING_DOTS="true"

source $ZSH/oh-my-zsh.sh

[[ -r /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]] \
  && source /opt/homebrew/share/zsh-autosuggestions/zsh-autosuggestions.zsh

[[ -r /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]] \
  && source /opt/homebrew/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
plugins=(
  bgnotify
  thefuck
  nvm
  tmux
)

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# completions

# Load Angular CLI autocompletion.
# source <(ng completion script)

# autoload completion
autoload -U +X bashcompinit && bashcompinit

# terraform completions
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# bun completions
[ -s "/Users/riethmue/.bun/_bun" ] && source "/Users/riethmue/.bun/_bun"

# manual load nvm to use default node version
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

nvm use default &> /dev/null

# functions
ranger_cd() {
    local tempfile="${HOME}/.rangerdir"
    command ranger --choosedir="$tempfile" "$@"
    if [[ -f $tempfile && -s $tempfile ]]; then
        cd "$(cat "$tempfile")" || echo "could not change dir: $(cat "$tempfile")"
        rm -f "$tempfile"
    fi
}

kill_process() {
    local port=$1
    local pids=$(lsof -t -i:$port)

    if [[ -z $pids ]]; then
        echo "No process is using port $port."
    else
        # Schleife durch jede PID und einzeln verarbeiten
        echo "$pids" | while read -r pid; do
            if kill -9 "$pid" 2>/dev/null; then
                echo "Process on port $port (PID: $pid) killed successfully."
            else
                echo "Failed to kill process with PID: $pid."
            fi
        done
    fi
}


# aliases
## navigating to last dir in ranger when exiting ranger
alias ranger="ranger_cd"
## kills current process on <port>
alias kill_process="kill_process"
# reset configuration
alias macos_configs_reset="rm -f ~/.macos_configs_initalized && echo 'Configuration reset. It will run again on next terminal start.'"
# print system information
alias system_info="system_profiler SPSoftwareDataType SPHardwareDataType"
export PATH="/opt/homebrew/opt/openjdk@17/bin:$PATH"
eval "$(direnv hook zsh)"
