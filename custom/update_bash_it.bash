#!/usr/bin/env bash

echo Updating bash-it...

pushd ~/.bash-it >> /dev/null
  git pull >> /dev/null
popd >> /dev/null

echo Updating bash-it... complete.
