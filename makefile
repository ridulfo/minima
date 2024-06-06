all:

kernel:build/Image
build/Image: $(wildcard kernel/*)
	cd kernel; ./build.sh

userland: build/userland
build/userland: $(wildcard minima/**/*)
	cd userland;\
	cargo build --release --target aarch64-unknown-linux-musl;\
	mkdir -p ../build/userland;\
	mv target/aarch64-unknown-linux-musl/release/init ../build/userland

rootfs: build/rootfs.gz
build/rootfs.gz: $(wildcard file-system/*) build/userland
	cp -r file-system/rootfs build/rootfs
	cd file-system; ./build.sh build

# Temporary fix to avoid building the kernel
ifeq ($(MAKEKERN),0)
run: userland rootfs
else
run: kernel userland rootfs
endif
	cd build;\
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel Image -initrd rootfs.gz -nographic

clean:
	rm -r build/rootfs build/userland build/rootfs.gz #build/Image