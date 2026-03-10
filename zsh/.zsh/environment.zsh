# npm packages in PATH
NPM_PACKAGES="${HOME}/.npm-packages"
export PATH="$NPM_PACKAGES/bin:$PATH"

if [ -s "$HOME/.deno" ]; then
  export DENO_HOME="$HOME/.deno"
  export PATH="$DENO_HOME/bin:$PATH"
fi

if [ -s "$HOME/.bun" ]; then
  export BUN_HOME="$HOME/.bun"
  export PATH="$BUN_HOME/bin:$PATH"
  source "$BUN_HOME/_bun"
fi


if [ -f "/usr/bin/opam" ]
then
    export PATH="$PATH:$HOME/.opam/default/bin"
    opam () { eval "$(/usr/bin/opam env)" && /usr/bin/opam $@ }
fi

export PATH="$HOME/.cargo/bin:$PATH"

# Editor and pager
export EDITOR="vim"
export VISUAL="vim"

bindkey -e # Even though vim is $EDITOR, we want emacs-esque line editing.

unsetopt extended_glob
