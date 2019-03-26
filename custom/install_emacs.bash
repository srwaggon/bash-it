#!/usr/bin/env bash

emacs_config=~/.emacs
if [ ! -e $emacs_config -a ! -h $emacs_config ]; then
  $BASH_IT/custom/emacs/install_emacs.sh
fi
