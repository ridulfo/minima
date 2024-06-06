use std::io::Write;

use userland::exec::execute;

fn main() {
    loop {
        print!("> ");
        std::io::stdout().flush().unwrap();
        let mut input = String::new();
        std::io::stdin().read_line(&mut input).unwrap();
        let input = input.trim();
        let mut parts = input.split_whitespace();
        let command = parts.next().unwrap(); // Get the first part as the command
        let args: Vec<&str> = parts.collect();

        if command.trim().is_empty() {
            continue;
        }

        if command == "exit" {
            break;
        }

        if command == "env" {
            for (key, value) in std::env::vars() {
                println!("{}={}", key, value);
            }
            continue;
        }

        if command == "cd" {
            std::env::set_current_dir(args[0]).unwrap();
            continue;
        }

        match execute(command, &args) {
            Err(e) => eprintln!("Error executing command: {:?}", e),
            _ => (),
        }
        println!("")
    }
}
