<div>
    <p align="center"><img src="media/logo.png" height="200px" width="200px" /></p>
    <h1 align="center">Minima</h1>
</div>

An ultra-minimalistic [Linux distribution](https://en.wikipedia.org/wiki/Linux_distribution) built from scratch in Rust! 🔥

**The goal of the system:**
- Build a [userland](https://en.wikipedia.org/wiki/User_space_and_kernel_space) environment for the Linux kernel
- Depend only on [musl](https://musl.libc.org)
- Neatly package everything for [QEMU](https://en.wikipedia.org/wiki/QEMU) and [Docker](https://en.wikipedia.org/wiki/Docker_(software))

**What is outside of the scope?** - in the short-term
- implement [libc](https://en.wikipedia.org/wiki/C_standard_library)
- implement a kernel
- implement drivers

## Getting started
To run the operating system in QEMU run the following command:
```bash
make run
```
<img alt="boot process print-out" src="media/boot.gif"/>


## Milestones
- [ ] automate building
- [ ] automate testing
- [ ] implement an init-system
- [ ] create rust development environment
- [ ] implement
    - [ ] shell program
    - [ ] file system commands (ls, cd, cat)
    - [ ] text editor

## Contribute
Feel free to contribute to any part of this project! If you are unsure where to start, check out the [open issues](https://github.com/ridulfo/minima/issues).

Any amount of help or feedback is appreciated. 🙏
