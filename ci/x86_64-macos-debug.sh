#!/bin/sh
zig_pkg=zig-macos-x86_64-$zig_version.tar.xz

if [[ $command == "" ]]
then
	command="zig build test"
fi

wget https://ziglang.org/builds/$zig_pkg \
	> /dev/null 2>&1
mkdir -p /github/home/zig
tar --strip-components=1 -xf $zig_pkg \
	-C /github/home/zig 
export PATH=$PATH:/github/home/zig

eval "$command"
