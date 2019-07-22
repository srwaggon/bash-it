#!/usr/bin/env bash

function check_for_updates() {
  # echo Updating apt...
  apt list --upgradeable

  # sudo apt dist-upgrade \
  #      --assume-yes \
  #      --quiet

  # sudo apt autoremove \
  #      --assume-yes \
  #      --quiet
  # echo Updating apt... complete.
}

check_for_updates

