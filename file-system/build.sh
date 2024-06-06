#! /bin/bash
set -o errexit

cd rootfs && find . | cpio -ov --format=newc | gzip -9 > ../../build/rootfs.gz
