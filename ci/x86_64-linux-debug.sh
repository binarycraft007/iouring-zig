#!/bin/sh
zig_pkg=zig-linux-x86_64-$zig_version.tar.xz
command="zig build test"

wget https://ziglang.org/builds/$zig_pkg \
	> /dev/null 2>&1
mkdir -p $pwd/zig
tar --strip-components=1 -xf $zig_pkg \
	-C $pwd/zig 
export PATH=$PATH:$pwd/zig

eval "$command"
