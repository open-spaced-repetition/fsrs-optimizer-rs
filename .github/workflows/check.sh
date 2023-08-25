#!/bin/bash

set -e

cargo fmt --check || (
    echo
    echo "Please run 'cargo fmt' to format the code."
    exit 1
)

cargo clippy -- -Dwarnings

install -d tests/data/
pushd tests/data/
wget https://github.com/open-spaced-repetition/fsrs-optimizer-burn/files/12394182/collection.anki21.zip
unzip *.zip
RUST_BACKTRACE=full cargo test --release # may occur test cosine_annealing::test_lr_scheduler ... FAILED
