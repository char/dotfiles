source ~/.zsh/antidote/antidote.zsh
zsh_plugins=${ZDOTDIR:-$HOME}/.zsh_plugins
if [[ ! ${zsh_plugins}.zsh -nt ${zsh_plugins}.txt ]]; then
  (
    source /path-to-antidote/antidote.zsh
    antidote bundle <${zsh_plugins}.txt >${zsh_plugins}.zsh
  )
fi
source ${zsh_plugins}.zsh

setopt interactivecomments

source ~/.zsh/history.zsh
source ~/.zsh/completion.zsh
source ~/.zsh/safe-paste.zsh
source ~/.zsh/keybindings.zsh
source ~/.zsh/title.zsh
source ~/.zsh/config.zsh
source ~/.zsh/appearance.zsh
source ~/.zsh/prompt.zsh
source ~/.zsh/environment.zsh

if command -v brew &> /dev/null
then
    source ~/.zsh/macos.zsh
fi
