#!/usr/bin/env bash
IFS=$'\0' # only split strings on ASCII NUL during parameter expansion, breaks some commands
set -o nounset # error when expanding unset variables
set -o errexit # exit immediately if a command returns non-zero
set -o errtrace # generate ERR event on error, so handlers like 'trap $cmd ERR' commands will run, useful for logging

echo "Welcome to our project!"
echo "Not implemented." >&2
exit 1
