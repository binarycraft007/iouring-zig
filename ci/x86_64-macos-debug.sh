#!/bin/sh
zig_pkg=zig-macos-x86_64-$zig_version.tar.xz
command="zig build test --summary all"

wget https://ziglang.org/builds/$zig_pkg \
	> /dev/null 2>&1
mkdir -p $PWD/zig
tar --strip-components=1 -xf $zig_pkg \
	-C $PWD/zig 
export PATH=$PATH:$PWD/zig

eval "$command"
