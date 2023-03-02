$zig_version = $($Env:zig_version)
$zig_pkg = "zig-windows-x86_64-$zig_version.zip"
$command = $($Env:command)


if ($command -eq $null) {
	$command = "zig build test"
}

Start-BitsTransfer `
	-Source "https://ziglang.org/builds/$zig_pkg" `
	-Destination .\

mkdir zig

tar --strip-components=1 -xf $zig_pkg -C zig
$env:Path += ';C:\github\home\zig'
Invoke-Expression "$command"
