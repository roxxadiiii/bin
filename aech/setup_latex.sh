#!/bin/env bash

cat <<EOF
 ________  _______  _________  ___  ___  ________       
|\   ____\|\  ___ \|\___   ___\\  \|\  \|\   __  \      
\ \  \___|\ \   __/\|___ \  \_\ \  \\\  \ \  \|\  \     
 \ \_____  \ \  \_|/__  \ \  \ \ \  \\\  \ \   ____\    
  \|____|\  \ \  \_|\ \  \ \  \ \ \  \\\  \ \  \___|    
    ____\_\  \ \_______\  \ \__\ \ \_______\ \__\       
   |\_________\|_______|   \|__|  \|_______|\|__|       
   \|_________|                                         
                                                        
                                                        
 ___       ________  _________  _______      ___    ___ 
|\  \     |\   __  \|\___   ___\\  ___ \    |\  \  /  /|
\ \  \    \ \  \|\  \|___ \  \_\ \   __/|   \ \  \/  / /
 \ \  \    \ \   __  \   \ \  \ \ \  \_|/__  \ \    / / 
  \ \  \____\ \  \ \  \   \ \  \ \ \  \_|\ \  /     \/  
   \ \_______\ \__\ \__\   \ \__\ \ \_______\/  /\   \  
    \|_______|\|__|\|__|    \|__|  \|_______/__/ /\ __\ 
                                            |__|/ \|__| 
                                                        

EOF
# Perl deps for latexmk
perl_deps=(
  perl-yaml-tiny
  perl-file-homedir
)

# TeX Live groups + biber for LuaLaTeX (Maths & CS)
tex_packages=(
  texlive-luatex
  texlive-latexrecommended
  texlive-latexextra
  texlive-mathscience
  texlive-bibtexextra
  texlive-fontsrecommended
  texlive-fontsextra
  texlive-pictures
  texlive-binextra
  biber
)

paru -S --needed "${perl_deps[@]}"
paru -S --needed "${tex_packages[@]}"
