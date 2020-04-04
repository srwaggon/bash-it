#!/usr/bin/env bash

JAVAFX_PATH=/opt/javafx-sdk-11.0.2
if [ -f $JAVAFX_PATH ]; then
  export JAVAFX_PATH=$JAVAFX_PATH
fi
