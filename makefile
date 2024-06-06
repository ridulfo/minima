all:

kernel:build/Image
build/Image: $(wildcard kernel/*)
	cd kernel; ./build.sh

userland: build/userland
build/userland: $(wildcard userland/**/*)
	cd userland;\
	cargo build --release --target aarch64-unknown-linux-musl;\
	mkdir -p ../build/userland;\
	./move-binaries.sh

rootfs: build/rootfs.gz
build/rootfs.gz: $(wildcard file-system/*) build/userland
	./file-system/build.sh
# Temporary fix to avoid building the kernel
ifeq ($(MAKEKERN),0)
run: userland rootfs
else
run: kernel userland rootfs
endif
	cd build;\
	qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel Image -initrd rootfs.gz -nographic

clean:
	rm -r build/rootfs build/userland build/rootfs.gz

clean-all:
	rm -r build/rootfs build/userland build/rootfs.gz
	rm build/Image

