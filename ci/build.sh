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

# Run linter.
# TODO(dolph): Clippy is unstable and doesn't actually build. Re-enable it when
# it's stable: https://github.com/Manishearth/rust-clippy
# cargo install clippy
# cargo clippy

# Test the project.
cargo test

# Build the project.
cargo build --release

# Smoke test the result.
cargo run
./target/debug/skeleton
./target/debug/skeleton --help
./target/debug/skeleton --version
./target/debug/skeleton --verbose
./target/debug/skeleton --debug
