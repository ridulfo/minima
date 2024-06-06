use std::{thread::sleep, time::Duration};

use userland::exec::execute;

fn main() {
    println!("Welcome to Minima OS!");
    sleep(Duration::from_secs(1));

    loop {
        let _ = execute("shell", &[""]);
        println!("");
        println!("shell process died, restarting...");
        println!("");
    }
}
