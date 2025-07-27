#! /bin/bash
set -o errexit

# The current directory is expected to be the project's root directory
# TODO: make it less dependant on the current directory

# Copy the file-system to the build directory
cp -r file-system/rootfs build/rootfs

# Create the bin directory
mkdir -p build/rootfs/bin

# Check that the userland binaries are built
if [ ! -f build/userland/init ]; then
    echo "Userland binaries are not built."
fi

# Copy the userland binaries to the rootfs directory
cp -p build/userland/* build/rootfs/bin

# Now the disk image will be created
cd build

# Create disk image file
dd if=/dev/zero of=disk.img bs=1M count=100

# Make a ext2 filesystem
mkfs.ext2 disk.img

# Create all of the directories
find rootfs -type d | while read -r dir; do debugfs -w -R "mkdir ${dir#rootfs}" disk.img; done

# Copy all of the files
find rootfs -type f | while read -r file; do debugfs -w -R "write $file ${file#rootfs}" disk.img; done
