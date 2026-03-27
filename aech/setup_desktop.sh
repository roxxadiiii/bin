#!/bin/env bash


sudo pacman -Sy
sudo pacman -S --needed kitty hyprland rofi
sudo pacman -S --needed sddm
sudo pacman -S --needed awww swaync
echo 'exec-once = awww-daemon &' >> ~/.config/hypr/hyprland.conf
echo 'exec-once = swaync &' >> ~/.config/hypr/hyprland.conf
sudo pacman -S --needed lxqt-policykit
echo 'exec-once = /usr/lib/lxqt-policykit-agent &' >> ~/.config/hypr/hyprland.conf
sudo pacman -S --needed nwg-look
sudo pacman -S --needed gtk-engine-murrine
sudo pacman -S --needed wl-clipboard cliphist wofi

