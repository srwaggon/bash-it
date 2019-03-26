#!/usr/bin/env bash

git_config_file=~/.gitconfig

function prompt_gitconfig {
  while true; do
    read -p "Do you wish to link .gitconfig? " yn
    case $yn in
      [Yy]* ) configure_git; break;;
      [Nn]* ) break;;
      * ) echo "Please answer yes or no.";;
    esac
  done
}

function link_gitconfig {
  source_file=$BASH_IT/custom/git/gitconfig
  dest_file=$git_config_file
  ln -sf $source_file $dest_file
  echo "Linked $dest_file --> $source_file"
}

function link_gitignore {
  source_file=$BASH_IT/custom/git/gitignore
  dest_file=~/.gitignore
  ln -sf $source_file $dest_file
  git config --global core.excludesfile ~/.gitignore
  echo "Linked $dest_file --> $source_file"
}


function configure_git {
  link_gitconfig
  link_gitignore
}


if [ ! -f $git_config_file -a ! -h $git_config_file ]; then
  prompt_gitconfig
fi
