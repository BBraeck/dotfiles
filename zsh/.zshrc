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
