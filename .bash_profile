if [ -f ~/.bashrc ]; then
  . ~/.bashrc
fi

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
export PATH="$HOME/.pyenv/bin:$PATH"
eval "$(pyenv init -)"


# tfenv
export PATH="$HOME/.tfenv/bin:$PATH"

# terraform
export TF_LOG=DEBUG
export TF_LOG_PATH='./terraform.log'

# azure cli
alias az_access_key=~/.azure/az_access_key.sh

