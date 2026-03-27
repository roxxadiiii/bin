#!/bin/sh

intro(){
cat << "EOF"
┌─┐┌─┐┌┬┐┬ ┬┌─┐
└─┐├┤  │ │ │├─┘
└─┘└─┘ ┴ └─┘┴  
┌─┐┬┌┬┐        
│ ┬│ │         
└─┘┴ ┴         
EOF
}

install(){
    sudo pacman -S git --needed --noconfirm
    sudo pacman -S github-cli --needed --noconfirm
    sudo pacman -S lazy-git --needed --noconfirm
}

user(){
    git config --global user.name "roxxadiiii"
    git config --global user.email "itsmeadityakumararya@gmail.com"
}

configs(){
    git config --global pull.rebase false
    sudo git config --system core.editor nano
    git config --global push.default simple
}

gh(){
    gh auth login
    sleep 5
    gh setup-git
}

install
user
configs
gh
