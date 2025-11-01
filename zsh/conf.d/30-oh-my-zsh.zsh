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
    conda-env
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
    virtualenv
    zsh-interactive-cd
  )

  if [ -f "$ZSH/custom/themes/powerlevel10k/powerlevel10k.zsh-theme" ] ; then
    ZSH_THEME=powerlevel10k/powerlevel10k
  else
    ZSH_THEME=jonathan
  fi

  # Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
  # Initialization code that may require console input (password prompts, [y/n]
  # confirmations, etc.) must go above this block; everything else may go below.
  if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
    source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
  fi

  source "$ZSH/oh-my-zsh.sh"

  # To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
  [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

fi
