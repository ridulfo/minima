## Documentation

### Project structure
#TODO implement

Root makefile has the following commands:
- `make kernel` - build the Linux kernel
- `make minima` - build the userland
- `make rootfs` - build userland and build and populate the root file-system
- `make qemu` - build and run everything in qemu

### Build directory
#TODO implement

The build directory will contain all the artifacts generated. After everything is built, it might look like this:
```
> tree build
build
├── Image       # kernel image
├── minima      # built binaries
└── rootfs.gz   # cpio gz
```

### Running
When the system is run with qemu, the following command takes all the components from their respective directories and starts.
```bash
qemu-system-aarch64 -machine virt -cpu cortex-a57 -kernel build/Image -initrd build/rootfs -nographic
```
