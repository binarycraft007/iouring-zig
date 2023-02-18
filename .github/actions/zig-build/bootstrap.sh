#!/bin/bash
pacman -Syu --noconfirm
pacman -S base-devel namcap git --noconfirm
pacman -Sc --noconfirm

echo 'nobody ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
cat /etc/sudoers

git clone https://aur.archlinux.org/yay.git
pacman -S go --noconfirm
mkdir -p /.cache/go-build
chown -R nobody yay
chown -R nobody /.cache
pushd yay
sudo -u nobody makepkg -cr
pacman -U *.pkg.tar.zst --noconfirm
popd
pacman -Rsn go --noconfirm
pacman -Sc --noconfirm
rm -rf yay
rm -rf /.cache/go-build
