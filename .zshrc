# The following lines were added by compinstall

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _ignored _approximate
zstyle ':completion:*' completions 1
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' format 'Completing %d'
zstyle ':completion:*' glob 1
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' list-suffixes true
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' max-errors 2
zstyle ':completion:*' menu select=0
zstyle ':completion:*' original true
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'Found %s errors'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' verbose true
zstyle :compinstall filename '/home/andreas/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.zsh_hist
HISTSIZE=1000
SAVEHIST=1000
setopt beep
unsetopt autocd nomatch
bindkey -v
# End of lines configured by zsh-newuser-install

# Add keybinding to go from vi-insert-mode to vi-cmd-mode
bindkey 'jk' vi-cmd-mode
bindkey 'kj' vi-cmd-mode

# Load prompt plugin
autoload -Uz promptinit
promptinit
prompt adam2

# Fish syntax highlignting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

alias ls="ls --color=auto"
alias pacman="pacman --color=auto"
alias scroff="xset dpms force off"
alias grep="grep --color=auto"
alias df="df -h"
alias du="du -ch"

# Change default colors for ls
eval "$(dircolors ~/.dircolors)";

# wttr function
wttr() {
	curl www.wttr.in/$1
}

# Reduce the keytimeout for vim keybindings from 0.4s to 0.1s
export KEYTIMEOUT=2
