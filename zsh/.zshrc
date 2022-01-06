~/.zsh/antibody/get-antibody.sh

source <(antibody init)
antibody bundle < ~/.zsh/antibody/bundles

if [ "$TERM" = "xterm-termite" ]
then
    export TERM="xterm-256color"
fi

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

if ! command -v brew &> /dev/null
then
    source ~/.zsh/macos.zsh
fi
