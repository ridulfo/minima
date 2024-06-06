#! /bin/bash
set -o errexit

# Ensure we are in the correct directory
cd "$(dirname "$0")"
cd rootfs

# Generate the rootfs.gz file
find . | cpio -ov --format=newc | gzip -9 > ../rootfs.gz

cd ..

# Move the generated rootfs.gz to the appropriate location
mv rootfs.gz ../build/rootfs.gz
