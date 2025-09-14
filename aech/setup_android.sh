#!/bin/sh

intro(){
cat << "EOF"
┌─┐┌─┐┌┬┐┬ ┬┌─┐    
└─┐├┤  │ │ │├─┘    
└─┘└─┘ ┴ └─┘┴      
┌─┐┌┐┌┌┬┐┬─┐┌─┐┬┌┬┐
├─┤│││ ││├┬┘│ ││ ││
┴ ┴┘└┘─┴┘┴└─└─┘┴─┴┘    

BY github.com/roxxadiiii
EOF
}

install(){
    intro
    sudo pacman -S scrcpy
    sudo pacman -S android-sdk-platform-tools
    sudo pacman -S android-tools
}