# npm packages in PATH
NPM_PACKAGES="$HOME/.npm-packages"
if [ -s "$NPM_PACKAGES" ]; then
  export PATH="$NPM_PACKAGES/bin:$PATH"
fi

if [ -s "$HOME/.deno" ]; then
  export DENO_HOME="$HOME/.deno"
  export PATH="$DENO_HOME/bin:$PATH"
fi

if [ -s "$HOME/.bun" ]; then
  export BUN_HOME="$HOME/.bun"
  export PATH="$BUN_HOME/bin:$PATH"
  source "$BUN_HOME/_bun"
fi

if [ -f "/usr/bin/opam" ]; then
  export PATH="$PATH:$HOME/.opam/default/bin"
  opam () { eval "$(/usr/bin/opam env)" && /usr/bin/opam $@ }
fi

if [ -s "$HOME/.cargo" ]; then
  export PATH="$HOME/.cargo/bin:$PATH"
fi

export PATH="$HOME/.local/bin:$PATH"

# Editor and pager
export EDITOR="vim"
export VISUAL="vim"

bindkey -e # Even though vim is $EDITOR, we want emacs-esque line editing.

unsetopt extended_glob
