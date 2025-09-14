#!/bin/sh
# this script will use to setup vscode , vscodium , vscodium-insider , vscode-insider 
# VScodium = codium
# VScode = code
# code-oss = code-oss
# VScodium insider = codium-insider
#
# by github.com/roxxadiiii
# this will takes args and put it in a variable named code 


intro(){
cat << "EOF"

┌─┐┌─┐┌┬┐┬ ┬┌─┐
└─┐├┤  │ │ │├─┘
└─┘└─┘ ┴ └─┘┴  
┌─┐┌─┐┌┬┐┌─┐   
│  │ │ ││├┤    
└─┘└─┘─┴┘└─┘   

by :- github.com/roxxadiiii
EOF
}

usage(){
  echo "$intro"
  echo "Usage of $0 [OPTIONS]"
  echo "./$0 [options]"
  echo "code --------------------------> VScode"
  echo "codium ------------------------> VScodium"
  echo "code-oss ----------------------> code-oss"
  echo "codium-insiders ----------------> codium-insider"
  echo "code-insiders ------------------> VScode insider"
  echo "--help/-h ---------------------> for USAGE of the script"
}


install(){
  intro
  $code --install-extension PKief.material-product-icons
  $code --install-extension esbenp.prettier-vscode
  $code --install-extension formulahendry.code-runner
  $code --install-extension ritwickdey.LiveServer
  $code --install-extension PKief.material-icon-theme
  $code --install-extension formulahendry.auto-rename-tag
  $code --install-extension drewxs.tokyo-night-dark
  $code --install-extension cschlosser.doxdocgen
  $code --install-extension naumovs.color-highlight
  $code --install-extension usernamehw.errorlens
  $code --install-extension pinage404.bash-extension-pack
  $code --install-extension donjayamanne.python-extension-pack
  $code --install-extension vscjava.vscode-java-pack
  $code --install-extension ms-vscode.cpptools-extension-pack
  $code --install-extension wayou.vscode-todo-highlight
}


if [[ "$1" == "-h" || "$1" == "--help" ]]; then
  intro
  usage
fi