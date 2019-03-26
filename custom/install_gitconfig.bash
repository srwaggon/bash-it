#!/usr/bin/env bash

git_config_file=~/.gitconfig

function prompt_gitconfig {
  while true; do
    read -p "Do you wish to link .gitconfig? " yn
    case $yn in
      [Yy]* ) copy_gitconfig; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function copy_gitconfig {
  source_file=$BASH_IT/custom/git/gitconfig
  ln -sf $source_file $git_config_file
  echo "Linked $git_config_file --> $source_file"
}


if [ ! -f $git_config_file -a ! -h $git_config_file ]; then
  prompt_gitconfig
fi
