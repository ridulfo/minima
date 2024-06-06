#! /bin/bash

set -o errexit

function decorated_print {
    echo ""
    echo "===================================="
    echo $1
    echo "===================================="
    echo ""
}

decorated_print "Getting the kernel source code..."
wget https://cdn.kernel.org/pub/linux/kernel/v6.x/linux-6.9.3.tar.xz

decorated_print "Extracting the code..."
tar -xf linux-6.9.3.tar.xz
cd linux-6.9.3

decorated_print "Configuring build options..."
make defconfig

decorated_print "Building..."
make -j`nproc`

decorated_print "Copied kernel to /mnt/shared"
cp arch/arm64/boot/Image /mnt/shared
