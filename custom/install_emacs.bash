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
  source_file=$BASH_IT/custom/emacs/emacs_config.el
  dest_file=~/.emacs
  create_link $source_file $dest_file
}

function link_octave_config {
  filename=octave_config.el
  source_file=$BASH_IT/custom/emacs/$filename
  dest_file=~/.emacs.d/$filename
  create_link $source_file $dest_file
}

function create_link {
  source_file=$1
  dest_file=$2
  if [ ! -e $dest_file -a ! -h $dest_file ]; then
    ln -sf $source_file $dest_file
  fi
}

install_emacs
link_emacs
link_octave_config
