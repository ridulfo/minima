<div>
    <p align="center"><img src="logo.png" height="200px" width="200px" /></p>
    <h1 align="center">Minima</h1>
</div>

An ultra-minimalistic [userland](https://en.wikipedia.org/wiki/User_space_and_kernel_space) for the [Linux kernel](https://en.wikipedia.org/wiki/Linux_kernel), built from scratch with [musl](https://musl.libc.org) and Rust 🔥.


**What is the project's scope?**
- implement all the typical userland programs found in a GNU/Linux system
- package the system for [QEMU](https://en.wikipedia.org/wiki/QEMU) and docker

**What does this project NOT do?** - in the short-term
- implement [libc](https://en.wikipedia.org/wiki/C_standard_library)
- implement a kernel
- implement drivers

## Milestones
- [ ] automate building
- [ ] automate testing
- [ ] implement an init-system
- [ ] create rust development environment
- [ ] implement
    - [ ] shell program
    - [ ] file system commands (ls, cd, cat)
    - [ ] text editor
