#!/bin/bash
set -ex

DIR=`dirname $(readlink -f $0)`
cd $DIR/..

# Show version information.
rustc --version
cargo --version

# Build and deny warnings.
cargo rustc -- -D warnings

# Run clippy from nightly/stable and deny warnings.
rustup run nightly cargo clippy -- -D warnings

# Test the project.
cargo test --verbose

# Smoke test the result.
export RUST_LOG=debug
cargo run
./target/debug/skeleton
./target/debug/skeleton --help
./target/debug/skeleton --version
./target/debug/skeleton --verbose
