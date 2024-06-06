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
        if command.trim().is_empty() {
            continue;
        }
        if command == "exit" {
            break;
        }

        // Collect the remaining parts into a vector of &str
        let args: Vec<&str> = parts.collect();

        // Call execute function with command and args
        match execute(command, &args) {
            Err(e) => eprintln!("Error executing command: {:?}", e),
            _ => (),
        }
        println!("")
    }
}
