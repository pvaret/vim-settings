## AUTOMATICALLY CONFIGURED STUFF FOLLOWS:

# The following lines were added by compinstall

zstyle ':completion:*' format '%F{blue}→ %d'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=* r:|=*'
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original true
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle :compinstall filename '/home/sundance/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=10000
setopt appendhistory notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install


## AUTOMATICALLY CONFIGURE STUFF ENDS

## MANUAL CONFIGURATION STUFF FOLLOWS

## Load configuration fragments:

find ~/.zsh/conf.d/ -type f -name "*.zsh" | sort -n | while read file ; do
  source "$file"
done
