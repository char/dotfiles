_prompt_color() {
  if [[ -n $SSH_CONNECTION ]]; then
    echo "%F{cyan}"
  else
    echo "%F{magenta}%F{13}"
  fi
}

function _prompt_parse_git_dirty() {
  local STATUS=''
  STATUS=$(command git status --porcelain --ignore-submodules=dirty 2> /dev/null | tail -n1)

  if [[ -n $STATUS ]]; then
    echo " *"
  else
    echo ""
  fi
}

_prompt_pipenv() {
  if [[ -n $PIPENV_ACTIVE ]]; then
    echo " [pipenv]"
  else
    echo ""
  fi
}

prompt_precmd() {
  if [ -z "${ZSH_NO_VCS_PROMPT+x}" ]; then
    vcs_info

    if [[ -z ${vcs_info_msg_0_} ]]; then
      PROMPT="$(_prompt_color)%3/%f$(_prompt_pipenv) $ "
    else
      PROMPT="$(_prompt_color)%3/%f ("
      PROMPT+='${vcs_info_msg_0_}'
      PROMPT+="$(_prompt_parse_git_dirty))$(_prompt_pipenv) $ "
    fi
  else
    PROMPT="$(_prompt_color)%3/%f$(_prompt_pipenv) $ "
  fi

  RPROMPT="%F{grey}%F{7}%n@%M%f"
}

prompt_init() {
  export PROMPT_EOL_MARK=''
  autoload -Uz add-zsh-hook
  autoload -Uz vcs_info

  add-zsh-hook precmd prompt_precmd

  zstyle ':vcs_info:*' enable git
  zstyle ':vcs_info:*' use-simple true
  zstyle ':vcs_info:git*' formats '%b'
  zstyle ':vcs_info:git*' actionformats '%b|%a'

  zstyle ':vcs_info:*' max-exports 2
}

prompt_init
