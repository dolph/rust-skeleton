#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`

# Install dependencies.
apt-get update
apt-get install -y rustc

# Build the project.
rustc $DIR/src/main.rs
