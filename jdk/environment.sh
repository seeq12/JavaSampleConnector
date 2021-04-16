#!/bin/bash

# Get directory of the script regardless of where it's invoked from
# From: http://stackoverflow.com/questions/59895/can-a-bash-script-tell-what-directory-its-stored-in
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

export JAVA_HOME=$DIR/files
export PATH=$JAVA_HOME/bin/:$PATH