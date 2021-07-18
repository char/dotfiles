function title {
    emulate -L zsh
    setopt prompt_subst

    [[ "$EMACS" == *term* ]] && return

    # if $2 is unset use $1 as default
    # if it is set and empty, leave it as is
    : ${2=$1}

    case "$TERM" in
        cygwin|xterm*|putty*|rxvt*|ansi)
            print -Pn "\e]2;$2:q\a" # set window name
            print -Pn "\e]1;$1:q\a" # set tab name
            ;;
        screen*)
            print -Pn "\ek$1:q\e\\" # set screen hardstatus
            ;;
        *)
            if [[ "$TERM_PROGRAM" == "iTerm.app" ]]; then
                print -Pn "\e]2;$2:q\a" # set window name
                print -Pn "\e]1;$1:q\a" # set tab name
            else
                # Try to use terminfo to set the title
                # If the feature is available set title
                if [[ -n "$terminfo[fsl]" ]] && [[ -n "$terminfo[tsl]" ]]; then
            echoti tsl
            print -Pn "$1"
            echoti fsl
        fi
            fi
            ;;
    esac
}

ZSH_THEME_TERM_TAB_TITLE_IDLE="%/"
ZSH_THEME_TERM_TITLE_IDLE="%/"

function title_precmd {
    emulate -L zsh

    title $ZSH_THEME_TERM_TAB_TITLE_IDLE $ZSH_THEME_TERM_TITLE_IDLE
}

function title_preexec {
    emulate -L zsh
    setopt extended_glob

    local CMD=${1[(wr)^(*=*|sudo|ssh|mosh|rake|-*)]:gs/%/%%}
    local LINE="${2:gs/%/%%}"

    title '$CMD' '%100>...>$LINE%<<'
}

precmd_functions+=(title_precmd)
preexec_functions+=(title_preexec)
