#!/usr/bin/env bash

function prompt_gitconfig {
  while true; do
    read -p "Do you wish to link .gitconfig? " yn
    case $yn in
      [Yy]* ) link_gitconfig; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function link_gitconfig {
  link=~/.gitconfig
  source_file=$BASH_IT/custom/git/gitconfig
  ln -sf $link $source_file
  echo "Linked $sourceFile --> $link"
}

prompt_gitconfig
