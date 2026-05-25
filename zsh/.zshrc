if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/dotfiles/powerlevel10k/powerlevel10k.zsh-theme

[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

bindkey -e

# Use the Zsh Line Editor (zle) standard terminfo map if available
# This maps common keys like Home, End, Delete, and Page Up/Down safely
typeset -g -A key

key[Home]="${terminfo[khome]}"
key[End]="${terminfo[kend]}"
key[Insert]="${terminfo[kich1]}"
key[Delete]="${terminfo[kdch1]}"
key[Up]="${terminfo[kcuu1]}"
key[Down]="${terminfo[kcud1]}"
key[Left]="${terminfo[kcub1]}"
key[Right]="${terminfo[kcuf1]}"
key[PageUp]="${terminfo[kpp]}"
key[PageDown]="${terminfo[knp]}"

# Setup keybindings for the mapped keys
[[ -n "${key[Home]}" ]]     && bindkey -- "${key[Home]}"     beginning-of-line
[[ -n "${key[End]}" ]]      && bindkey -- "${key[End]}"      end-of-line
[[ -n "${key[Insert]}" ]]   && bindkey -- "${key[Insert]}"   overwrite-mode
[[ -n "${key[Delete]}" ]]   && bindkey -- "${key[Delete]}"   delete-char
[[ -n "${key[Up]}" ]]       && bindkey -- "${key[Up]}"       up-line-or-history
[[ -n "${key[Down]}" ]]     && bindkey -- "${key[Down]}"     down-line-or-history
[[ -n "${key[Left]}" ]]     && bindkey -- "${key[Left]}"     backward-char
[[ -n "${key[Right]}" ]]    && bindkey -- "${key[Right]}"    forward-char

# Fix Ctrl+Left and Ctrl+Right arrow keys to jump words
bindkey "^[[1;5D" backward-word
bindkey "^[[1;5C" forward-word

# -------------------------------------------------------------
# History Configuration
# -------------------------------------------------------------

# Where zsh should save your history log file
HISTFILE="$HOME/.zsh_history"

# The maximum number of events to store in the internal history list
HISTSIZE=10000

# The maximum number of history events to save in the history file
SAVEHIST=10000

# Share history across all open terminal windows/tabs immediately
setopt SHARE_HISTORY

# Append to the history file instead of overwriting it
setopt APPEND_HISTORY

# Expire duplicate entries first when trim thresholds are met
setopt HIST_EXPIRE_DUPS_FIRST

# Do not write duplicate entries to the history file
setopt HIST_IGNORE_DUPS

# Remove extra blanks from each command line before adding to history
setopt HIST_REDUCE_BLANKS

# -------------------------------------------------------------
# Tab Completion System
# -------------------------------------------------------------

# Enable Zsh's advanced completion system
autoload -Uz compinit
compinit

# Optional but highly recommended: Enable an interactive menu 
# allowing you to use arrow keys to pick completion items
zstyle ':completion:*' menu select

# Make completion case-insensitive (e.g., typing 'git ST' matches 'git status')
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# -------------------------------------------------------------
# Colors and Modern 'ls' (eza) Aliases
# -------------------------------------------------------------

# Enable native Zsh terminal coloring capabilities
export CLICOLOR=1
autoload -Uz colors && colors

# Replace standard 'ls' with 'eza' (including icons and headers)
if (( $+commands[eza] )); then
    alias ls='eza --icons --header'
    alias ll='eza -lh --icons --header'
    alias la='eza -a --icons --header'
    alias lla='eza -lah --icons --header'
elif (( $+commands[exa] )); then
    # Fallback just in case your system uses the older 'exa' binary
    alias ls='exa --icons --header'
    alias ll='exa -lh --icons --header'
    alias la='exa -a --icons --header'
    alias lla='exa -lah --icons --header'
else
    # Fallback to standard colored ls if eza/exa aren't found globally
    alias ls='ls --color=auto'
    alias ll='ls -lh --color=auto'
    alias la='ls -A --color=auto'
fi
