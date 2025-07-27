#! /bin/bash

set -o errexit

function decorated_print {
    echo ""
    echo "===================================="
    echo $1
    echo "===================================="
    echo ""
}

decorated_print "Extracting the code..."
cd build/linux-source
tar -xf linux-source.tar.xz 

mv linux-6* linux-source
cd linux-source

decorated_print "Copying the configuration..."
cp /root/.config .config

decorated_print "Building..."
make -j`nproc`

decorated_print "Copied kernel to /mnt/shared"
cp arch/arm64/boot/Image /mnt/shared
