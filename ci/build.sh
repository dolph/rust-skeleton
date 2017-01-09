#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`
cd $DIR/..

# Install dependencies.
apt-get update
apt-get install -y curl

# Install Rust.
curl https://sh.rustup.rs -sSf > rustup-init.sh
chmod +x rustup-init.sh
sh rustup-init.sh -y
export PATH="$PATH:~/.cargo/bin"

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
cargo run
./target/release/skeleton
./target/release/skeleton --help
./target/release/skeleton --version
./target/release/skeleton --verbose
./target/release/skeleton --debug
