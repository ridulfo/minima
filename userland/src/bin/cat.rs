use std::env;

/// cat
/// A simple program that prints the contents of a file to the terminal
fn main() {
    let args: Vec<String> = env::args().collect();

    let file_names = if args.len() > 1 {
        args[1..].to_vec()
    } else {
        eprintln!("Usage: cat <file>...");
        return;
    };

    for file_name in file_names {
        let path = std::path::Path::new(&file_name);
        if !path.exists() {
            eprintln!("File does not exist: {}", file_name);
            continue;
        }
        let contents = std::fs::read_to_string(path).unwrap();
        println!("{}", contents);
    }
}
