#! /usr/bin/env bash

set -eu

die() {
	echo $@
	exit 1
}

usage() {
	echo "Usage: <file_to_check_for_errors>"
}

main() {
	grep '{\\color{red}ERROR/3}' $1 && die
}