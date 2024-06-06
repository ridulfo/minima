#! /bin/bash
set -o errexit

# The current directory is expected to be the project's root directory
# TODO: make it less dependant on the current directory

cp -r file-system/rootfs build/rootfs
cp build/userland/init build/rootfs
cd build/rootfs
find . | cpio -ov --format=newc | gzip -9 > ../rootfs.gz
