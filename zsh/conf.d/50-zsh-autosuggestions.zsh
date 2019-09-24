# Load automatic suggestion plugin (Ubuntu package 'zsh-autosuggestions'):
[ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ] && source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# Find matches based on historical patterns:
ZSH_AUTOSUGGEST_STRATEGY=match_prev_cmd

# Style for matches (238 is a nice dark grey):
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=238"

# Don't search for matches on line longer than this:
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
