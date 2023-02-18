#!/bin/bash

# fail whole script if any command fails
set -e

DEBUG=$3

if [[ -n $DEBUG  && $DEBUG = true ]]; then
    set -x
fi

zig_version=$1
zig_pkg=zig-linux-x86_64-$zig_version.tar.xz
command=$2


if [[ $command == "" ]]
then
	command="zig build test"
fi

# needs permissions so '/github/home/.config/yay'
# is accessible by yay
chown -R nobody /github/home

wget https://ziglang.org/builds/$zig_pkg
mkdir -p /github/home/zig
tar -xvf $zig_pkg -C /github/home/zig 
export PATH=$PATH:/github/home/zig

eval "$command"
