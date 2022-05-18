if [ -f ~/.zprofile ]; then
  . ~/.zprofile
fi

[ -z "$TMPDIR" ] && TMPDIR=/tmp

### Contains

# text
NC="\033[m"               # Color Reset
CR="$(echo -ne '\r')"
LF="$(echo -ne '\n')"
TAB="$(echo -ne '\t')"
ESC="$(echo -ne '\033')"

### Global
export LANG=en_US.UTF-8

# color
autoload -Uz colors
colors

# history
HISTFILE=~/.zsh_history
HISTSIZE=1000000
SAVEHIST=1000000

# bash_alias
alias ..='cd ..'
alias l='ls -1FG'           # Show long file information
alias la='ls -AFG'          # Show hidden files
alias ll='ls -lFG'          # Show long file information
alias lla='ls -alFG'        # Show hidden all files
alias llx='ls -lXBFG'       # Sort by extension
alias lls='ls -lSrFG'       # Sort by size, biggest last
alias lld='ls -ltrFG'       # Sort by date, most recent last
#alias lr='ls -lR'          # Recursive ls

alias cp="cp -i"
alias mv="mv -i"

alias grep='grep --color=auto'
alias vi='vim'

# Use plain vim.
alias nvim='vim -N -u NONE -i NONE'

# END
