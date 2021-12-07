# Load pyenv integration:
export PATH=~/.pyenv/bin:"$PATH"
which pyenv > /dev/null && eval "$(pyenv init --path)"
which pyenv > /dev/null && eval "$(pyenv init -)"
