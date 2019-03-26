#!/usr/bin/env bash

alias emacs='emacs -nw'
alias clean='rm -rf \#*\# && rm -rf .*~ && rm -rf *~'

function install_emacs {
  emacs --version >> /dev/null
  if [ $? -ne 0 ]; then
      sudo apt-get install emacs
  fi
}

function link_emacs {
  link=~/.emacs
  sourcefile=$BASH_IT/custom/emacs/emacs_config.ss
  if [ ! -e $link -a ! -h $link ]; then
      ln -sf $sourcefile $link
  fi
}

install_emacs
link_emacs
