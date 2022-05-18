# auto start tmux
tmux_count=$(ps -ax | grep '[t]mux' | wc -l)
if [ $SHLVL -eq 1 ]; then
  if [ $tmux_count -eq 0 ]; then
    tmux -u new-session
  elif [ $tmux_count -eq 1 ]; then
    tmux -u attach
  fi
fi

# jenv
export PATH="$HOME/.jenv/bin:$PATH"
eval "$(jenv init -)"

# rbenv
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"
