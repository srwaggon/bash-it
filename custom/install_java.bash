#!/usr/bin/env bash

function install_java() {
  java -version >> /dev/null
  if [ $? -ne 0 ]; then
    echo Installing Java...
    sudo apt-get install openjdk-11-jdk-headless
    echo Installing Java... complete.
  fi
  export JAVA_HOME=/usr/lib/java-11-openjdk-amd64/
}

install_java
