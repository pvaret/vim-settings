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
HISTSIZE=20000
SAVEHIST=20000
setopt appendhistory notify
unsetopt beep
bindkey -e
# End of lines configured by zsh-newuser-install


## AUTOMATICALLY CONFIGURED STUFF ENDS

## MANUAL CONFIGURATION STUFF FOLLOWS

## Load early local configuration fragments:

find ~/.zsh/conf.local-early.d/ -type f -name "*.zsh" | sort -n | while read file ; do
  source "$file"
done

## Load shared configuration fragments:

find ~/.zsh/conf.d/ -type f -name "*.zsh" | sort -n | while read file ; do
  source "$file"
done

## Load local configuration fragments:

find ~/.zsh/conf.local.d/ -type f -name "*.zsh" | sort -n | while read file ; do
  source "$file"
done

## Done. Anything after this line was added automatically by something and should probably be moved.
