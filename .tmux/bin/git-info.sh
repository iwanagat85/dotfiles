#!/bin/bash -e

pane_current_path=`tmux display-message -p -F "#{pane_current_path}"`
cd $pane_current_path

# Check git is available
if [ ! `which git` ] || [ ! -d .git ]; then
  exit 1
fi

get_tmux_text() {
  branch_name=$(get_branch_name)
  echo -e "#[bg=green]#[fg=black][git@${branch_name}]#[default]"
}

get_branch_name() {
  echo -e `git branch | grep \*.* | sed -e 's/\*\ //'`
}

get_user_name() {
  echo -e `git config --get user.name`
}

get_user_email() {
  echo -e `git config --get user.email`
}


echo $@

# check arguments
for i in "$@"
do
    case "$i" in
        "-h" | "--help")
            echo "usage: git-info [--help|-h][--user|--branch|--tmux]" 1>&2
            exit
            ;;
        "-t" | "--tmux")
            get_tmux_text
            exit $?
            ;;
        "-n" | "--user_name")
            get_user_name
            exit $?
            ;;
        "-m" | "--user_email")
            get_user_email
            exit $?
            ;;
        "-b" | "--branch")
            get_branch_name
            exit $?
            ;;
        -*|--*)
            echo "$i: unknown option" 1>&2
            exit 1
    esac
done
