#! /bin/sh

set -eu

usage() {
	echo "Usage: $0 <num_to_remove>"
}

main() {
	trap err EXIT
	local x

	if [ ! $# -eq 1 ]; then
		usage
		exit 1
	fi

	x=$(($1+0)) # type cast to int
	if [ $x -gt 0 ] && [ "$x" = "$1" ]; then
		sed -i "${x}d" $HOME/.ssh/known_hosts
	else
		return 1
	fi
}

err() {
	local _ec=$?

	[ $_ec -eq 0 ] && return 0;

	echo "got weird value as argument"
}