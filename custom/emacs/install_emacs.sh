#!/usr/bin/env bash

function prompt_emacs {
  while true; do
    printf "Do you wish to link .emacs?\n"
    read -p "" yn
    case $yn in
      [Yy]* ) install_and_link_emacs; break;;
      [Nn]* ) break;;
      * ) echo "[Y/n]";;
    esac
  done
}

function install_emacs {
  echo "Checking for emacs installation ..."
  emacs --version >> /dev/null
  if [ $? -eq 0 ]; then
    echo "Emacs already installed."
  else
    echo "Installing emacs."
    sudo apt-get install emacs
  fi
}

function link_emacs {
  link=~/.emacs
  sourcefile=$BASH_IT/custom/emacs/emacs_config.ss
  ln -sf $sourcefile $link
  echo "Linked to $link --> $sourcefile"
}

function install_and_link_emacs {
  install_emacs
  link_emacs
}

prompt_emacs
