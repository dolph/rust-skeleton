#!/bin/bash
set -e
set -x

DIR=`dirname $(readlink -f $0)`

curl https://sh.rustup.rs -sSf | sh
rustc src/main.rs
