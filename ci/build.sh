#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`
cd $DIR/..

# Show version information.
rustc --version
cargo --version

# Run linter.
# TODO(dolph): Clippy is unstable and doesn't actually build. Re-enable it when
# it's stable: https://github.com/Manishearth/rust-clippy
# cargo install clippy
# cargo clippy

# Build the project.
cargo build --release

# Test the project.
cargo test --verbose

# Smoke test the result.
export RUST_LOG=debug
cargo run
./target/release/skeleton
./target/release/skeleton --help
./target/release/skeleton --version
./target/release/skeleton --verbose
