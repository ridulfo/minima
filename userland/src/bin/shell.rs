use std::io::Write;

use userland::exec::execute;

fn main() {
    loop {
        print!("> ");
        std::io::stdout().flush().unwrap(); // Flush the buffer to ensure the prompt is displayed

        let mut input = String::new();
        std::io::stdin().read_line(&mut input).unwrap();
        let input = input.trim();
        let mut parts = input.split_whitespace();
        let command = parts.next().unwrap(); // Get the first part as the command
        let args: Vec<&str> = parts.collect();

        match command.trim() {
            "" => continue,
            "cd" => {
                if args.is_empty() {
                    eprintln!("Usage: cd <directory>");
                    continue;
                }
                std::env::set_current_dir(args[0]).unwrap();
            }
            "exit" => break,
            "env" => {
                for (key, value) in std::env::vars() {
                    println!("{}={}", key, value);
                }
            }
            "write" => { // Temporary command, while there is no > operator
                if args.len() < 2 {
                    eprintln!("Usage: write <file> <contents>");
                    continue;
                }
                let file_name = args[0];
                let contents = args[1..].join(" ");
                std::fs::write(file_name, contents).unwrap();
            }
            _ => match execute(command, &args) {
                Err(e) => eprintln!("Error executing command: {:?}", e),
                _ => (),
            },
        }
        println!("")
    }
}
