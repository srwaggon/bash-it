#!/usr/bin/env bash

git_config_file=~/.gitconfig


function install_git {
  git --version >> /dev/null
  if [ $? -ne 0 ]; then
    sudo apt-get install git
  fi
}

function link_gitconfig {
  source_file=$BASH_IT/custom/git/gitconfig
  dest_file=$git_config_file
  if [ ! -f $git_config_file -a ! -h $git_config_file ]; then
    ln -sf $source_file $dest_file
  fi
}

function link_gitignore {
  source_file=$BASH_IT/custom/git/gitignore
  dest_file=~/.gitignore
  ln -sf $source_file $dest_file
  git config --global core.excludesfile ~/.gitignore
}

install_git
link_gitconfig
link_gitignore


