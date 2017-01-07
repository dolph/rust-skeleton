#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`

# Install dependencies.
apt install curl

# Install rust.
curl https://sh.rustup.rs -sSf | sh

# Build the project.
rustc $DIR/src/main.rs
