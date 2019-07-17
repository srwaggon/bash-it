#!/usr/bin/env bash

echo Updating apt...

sudo apt dist-upgrade \
    --assume-yes \
    --quiet

sudo apt autoremove \
    --assume-yes \
    --quiet

echo Updating apt... complete.
