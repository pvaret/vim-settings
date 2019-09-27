# Helper function that we need to guess who owns this file here.
THIS_DIR="${0:a:h}"
function guess_default_user {
  dir="$THIS_DIR"

  while [ -n "$dir" -a "$dir" != "/" ] ; do
    maybe_username="$(basename "$dir")"
    if [ "$(basename "$(dirname "$dir")")" = "home" ] ; then
      echo "$maybe_username"
      exit
    fi
    dir="$(dirname "$dir")"
  done

  echo "?"
}


# If running a 256 color term, load theme engine powerlevel9k (Ubuntu package 'zsh-theme-powerlevel9k'):
[ $(echotc Co) -eq '256' ] && \
  [ -f /usr/share/powerlevel9k/powerlevel9k.zsh-theme ] && source /usr/share/powerlevel9k/powerlevel9k.zsh-theme

# Left prompt contents:
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(root_indicator context dir dir_writable vcs pyenv)

# Right prompt contents:
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs time)

# 'context': Default user. Hide element when we're that person.
DEFAULT_USER="$(guess_default_user)"

# 'dir': Max directories to show:
POWERLEVEL9K_SHORTEN_DIR_LENGTH=2

# 'dir': How to do the directory shortening:
POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_first_and_last
