use std::process::{Command, ExitStatus};
use std::io::Result;

pub fn execute(exe: &str, args: &[&str]) -> Result<ExitStatus> {
    Command::new(exe).args(args).spawn()?.wait()
}
