# If running a 256 color term, load theme engine powerlevel9k (Ubuntu package 'zsh-theme-powerlevel9k'):
[ $(echotc Co) -eq '256' ] && \
  [ -f /usr/share/powerlevel9k/powerlevel9k.zsh-theme ] && source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# Left prompt contents:
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs pyenv)

# Right prompt contents:
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)

# 'context': Default user. Hide element when we're that person.
DEFAULT_USER=sundance

# 'dir': Max directories to show:
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# 'dir': How to do the directory shortening:
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
