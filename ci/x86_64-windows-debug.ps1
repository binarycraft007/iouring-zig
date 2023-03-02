$zig_version = $($Env:zig_version)
$zig_pkg = "zig-windows-x86_64-$zig_version.zip"
$command = $($Env:command)


if ($command -eq $null) {
	$command = "zig build test"
}

$pwd=$(Get-Location).Path

Start-BitsTransfer `
	-Source "https://ziglang.org/builds/$zig_pkg" `
	-Destination "$pwd"

mkdir "$pwd"\zig

tar --strip-components=1 -xf $zig_pkg -C "$pwd\zig"
$env:Path += ";$pwd\zig"
Invoke-Expression "$command"
