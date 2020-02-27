#!/bin/bash

# Exit on error
set -e

# Default
# account_name=

opts_parse() {
	args=`getopt n: "$@"` || exit 1
	eval set -- "${args}"
	while true; do
		case "$1" in
			-n)
				account_name="$2"
				shift 2
				;;
			--)
				shift;
				break;;
			*)
				echo Error;
				exit 1
				;;
		esac
	done
}

do_exec() {
	if [ -z "$account_name" ]; then
		echo "Error: account_name is empty"
		exit 1
	fi

    access_key=$(az storage account keys list -n ${account_name} --query [0].value)
    access_key="${access_key//\"/}"

    echo "export ARM_ACCESS_KEY=${access_key}"

	exit 0
}

opts_parse $@
do_exec

