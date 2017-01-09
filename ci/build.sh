#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`
cd $DIR/..

# Install dependencies.
apt-get update
apt-get install -y \
    rustc \
    cargo \
;

# Show version information.
rustc --version
cargo --version

# Build the project.
cargo build --release

# Smoke test the result.
cargo run
