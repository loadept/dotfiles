if status is-interactive
    # Commands to run in interactive sessions can go here
end

set fish_greeting ""

alias ls='eza --octal-permissions --icons'
alias cat='bat'
alias tree='eza -T'
alias sqlite3='litecli'

set -gx EDITOR "nvim"

starship init fish | source
