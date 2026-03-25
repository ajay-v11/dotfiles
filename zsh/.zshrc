# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# UTF-8 locale is REQUIRED for Unicode/emoji support in tmux
export LANG=en_IN.UTF-8
export LC_ALL=en_IN.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='nvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch $(uname -m)"

# Set personal aliases, overriding those provided by Oh My Zsh libs,
# plugins, and themes. Aliases can be placed here, though Oh My Zsh
# users are encouraged to define aliases within a top-level file in
# the $ZSH_CUSTOM folder, with .zsh extension. Examples:
# - $ZSH_CUSTOM/aliases.zsh
# - $ZSH_CUSTOM/macos.zsh
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# --- Migrated from .bashrc ---

# Environment Variables
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export OLLAMA_MODELS=/mnt/ollama-usb/ollama

export PATH=/usr/local/cuda-12.4/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-12.4/lib64:$LD_LIBRARY_PATH
export PATH=/usr/local/cuda-11.8/bin:$PATH
export LD_LIBRARY_PATH=/usr/local/cuda-11.8/lib64:$LD_LIBRARY_PATH

export PATH="$HOME/.local/bin:$PATH"


export PATH="/snap/bin:$PATH"

export ANDROID_HOME=$HOME/Android/Sdk
export PATH=$ANDROID_HOME/emulator:$ANDROID_HOME/tools:$ANDROID_HOME/tools/bin:$ANDROID_HOME/platform-tools:$PATH
export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64

export GOPATH=$HOME/go
export GOBIN=$GOPATH/bin
export PATH=$PATH:$GOBIN
export GOPROXY=https://proxy.golang.org,direct
export PATH=$PATH:$GOPATH/bin
export PATH="$HOME/.local/share/nvim/mason/bin:$PATH"

# opencode
export PATH=/home/ajay/.opencode/bin:$PATH

# pnpm
export PNPM_HOME="/home/ajay/.local/share/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac

# Amp CLI
export PATH="/home/ajay/.amp/bin:$PATH"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Aliases
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Ghostty/Kitty Custom Prompt (Tokyonight)
if [[ "$TERM_PROGRAM" == "ghostty" || "$TERM" == "xterm-kitty" ]]; then
  # Colors
  local lav_color="%F{#c6a0f6}"
  local bg_color="%K{#292d3e}"
  local blue_color="%F{#7aa2f7}"
  local rst_color="%f%k"

  # Components
  local user_host="${bg_color}${lav_color} ❰ ajay ❱ ${rst_color}"
  local short_dir="${blue_color}%1d${rst_color}"

  # Set Prompt
  PROMPT="${user_host} ${short_dir} %# "
fi

# Enable vi mode
bindkey -v
source "$HOME/.cargo/env"

# study stream aliases
# Requires https://github.com/caarlos0/timer to be installed. spd-say should ship with your distro

# Configuration
declare -A pomo_options
pomo_options["work"]="45"
pomo_options["break"]="10"
POMO_LOG="$HOME/.pomodoro_log"

pomodoro () {
  if [ -n "$1" -a -n "${pomo_options["$1"]}" ]; then
    val=$1
    echo "$val" | lolcat
    
    # Run timer
    timer ${pomo_options["$val"]}m
    
    # Check exit code
    if [ $? -eq 0 ]; then
      # Success: Speak and Log
      spd-say "'$val' session done"
      echo "$(date '+%Y-%m-%d %H:%M:%S') $val" >> "$POMO_LOG"
    else
      # Cancelled: Speak and text feedback
      spd-say "'$val' session cancelled"
      echo "\nSession cancelled - not logged."
    fi
  fi
}

# Aliases
alias wo="pomodoro 'work'"
alias br="pomodoro 'break'"

# Stats function - Aggregates logs by Date
pomo_stats () {
  if [ -f "$POMO_LOG" ]; then
    # Print Header
    printf "\033[1;34m%-12s %-6s %-6s\033[0m\n" "Date" "Work" "Break"
    echo "-------------------------"
    
    # Process file with awk to count occurrences per date
    awk '{
      # $1 is the date (YYYY-MM-DD), $3 is the type (work/break)
      if ($3 == "work") w[$1]++
      if ($3 == "break") b[$1]++
      dates[$1] = 1
    }
    END {
      # Print raw data to be sorted
      for (d in dates) {
        printf "%-12s %-6s %-6s\n", d, w[d]+0, b[d]+0
      }
    }' "$POMO_LOG" | sort -r # Sort descending (newest dates first)
    
  else
    echo "No stats logged yet."
  fi
}
