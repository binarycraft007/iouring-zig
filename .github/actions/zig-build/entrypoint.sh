#!/bin/bash

# fail whole script if any command fails
set -e

DEBUG=$3

if [[ -n $DEBUG  && $DEBUG = true ]]; then
    set -x
fi

zig_version=$1
command=$2


if [[ $command == "" ]]
then
	command="zig build test"
fi

# needs permissions so '/github/home/.config/yay'
# is accessible by yay
chown -R nobody /github/home

yay -S zig-dev-bin --noconfirm

eval "$command"
