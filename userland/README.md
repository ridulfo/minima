# Userland

If you are on macos, you might need to install the musl cross compiler:

```bash
brew install filosottile/musl-cross/musl-cross
```

To build the userland, run:

```bash
cargo build --release --target aaarch64-unknown-linux-musl
```