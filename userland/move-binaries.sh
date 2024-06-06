#!/bin/bash

for file in target/aarch64-unknown-linux-musl/release/*; do
    if file "$file" | grep -q "executable"; then
        mv "$file" ../build/userland/
    fi
done
