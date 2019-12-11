# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

if [ -f "$ZSH/oh-my-zsh.sh" ] ; then

  # See ~/.oh-my-zsh/templates/zshrc.zsh-template for configuration options.

  # Uncomment the following line to use hyphen-insensitive completion.
  # Case-sensitive completion must be off. _ and - will be interchangeable.
  HYPHEN_INSENSITIVE="true"

  # Uncomment the following line to enable command auto-correction.
  # DISABLED for now: it often try to correct things that are not broken.
  #ENABLE_CORRECTION="true"

  # Uncomment the following line to display red dots whilst waiting for completion.
  COMPLETION_WAITING_DOTS="true"


  # Check out ~/.oh-my-zsh/plugins/ for plugins.
  plugins=(
    command-not-found
    golang
    mosh
  )

  source "$ZSH/oh-my-zsh.sh"
fi
