all:

kernel:build/Image
build/Image: $(wildcard kernel/*)
	cd kernel; ./build.sh

rootfs: build/rootfs.gz
build/rootfs.gz: $(wildcard file-system/*)
	cd file-system; ./build.sh

run: build/rootfs.gz build/Image
	cd build;\
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel Image -initrd rootfs.gz -nographic
