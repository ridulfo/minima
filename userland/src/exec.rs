use std::process::{Command, ExitStatus};
use std::io::Result;

pub fn execute(exe: &str, args: &[&str]) -> Result<ExitStatus> {
    Command::new(exe)
        .args(args)
        .envs(std::env::vars()) // Share parent's environment with the spawned process
        .spawn()?
        .wait()
}
