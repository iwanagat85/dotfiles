JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_65.jdk/Contents/Home
JAVA_PATH=$JAVA_HOME/bin
ANDROID_HOME=~/Library/Android/sdk/platform-tools
PG_HOME=/usr/local/Cellar/postgresql/9.6.4/bin
PG_DATA=/usr/local/var/postgres

export PATH=$PATH:/usr/local/bin
export PATH=$PATH:$JAVA_HOME
export PATH=$PATH:$JAVA_PATH
export PATH=$PATH:$ANDROID_HOME
export PATH=$PATH:$PG_HOME
export PATH=$PATH:$PG_DATA

if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

#tmux
function tm() {
  if [ -n "${1}" ]; then
    tmux attach-session -t ${1} || \
    tmux new-session -s ${1}
  else
    tmux attach-session || \
    tmux new-session
  fi
}
