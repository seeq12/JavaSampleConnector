#!/bin/bash

# Get directory of the script regardless of where it's invoked from
# From: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export M2_HOME=$DIR/files

export M2=$M2_HOME/bin

export M2_REPO=$HOME/.m2/repository

export PATH=$M2:$PATH
