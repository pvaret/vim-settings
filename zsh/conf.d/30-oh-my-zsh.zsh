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
    aliases
    alias-finder
    colorize
    command-not-found
    common-aliases
    copybuffer
    direnv
    emoji
    extract
    fasd
    fzf
    git
    golang
    gpg-agent
    jj
    jump
    mosh
    pip
    pyenv
    safe-paste
    ssh
    sudo
    systemd
    tmux
    ubuntu
    uv
    zsh-interactive-cd
  )

  source "$ZSH/oh-my-zsh.sh"
fi
