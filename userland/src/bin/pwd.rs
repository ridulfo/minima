use std::env;

fn main() {
    let args: Vec<String> = env::args().collect();

    let directory = if args.len() > 1 {
        std::path::PathBuf::from(&args[1])
            .canonicalize()
            .unwrap()
            .to_str()
            .unwrap()
            .to_string()
    } else {
        env::current_dir().unwrap().to_str().unwrap().to_string() // Convert to String to ensure it lives long enough
    };

    // Check if the directory exists
    if !std::path::Path::new(&directory).exists() {
        eprintln!("Directory does not exist: {}", directory);
        return;
    }

    println!("{}", directory);
}
