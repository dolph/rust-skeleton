#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`

# Install dependencies.
apt-get update
apt-get install -y \
    rustc \
    cargo \
;

# Build the project.
cd $DIR
cargo build

# Smoke test the result.
cargo run
