# Use vanilla jj autocompletion instead of the Oh My Zsh plugin. The plugin
# seems buggy.

if [[ -n "$command[jj]" ]] ; then
  source <(jj util completion zsh)
fi
