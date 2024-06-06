use std::env;
use std::fs;

fn main() {
    // Read command-line arguments
    let args: Vec<String> = env::args().collect();

    // Determine the directory to list (default to current directory if no argument provided)
    let directory = if args.len() > 1 {
        &args[1]
    } else {
        "."  // Default to current directory
    };

    // List files and directories in the specified directory
    if let Err(e) = list_directory(directory) {
        eprintln!("Error: {}", e);
    }
}

fn list_directory(directory: &str) -> Result<(), String> {
    // Read the directory contents
    let entries = fs::read_dir(directory).map_err(|e| format!("Failed to read directory: {}", e))?;

    // Print each entry in the directory
    for entry in entries {
        let entry = entry.map_err(|e| format!("Failed to read directory entry: {}", e))?;
        let path = entry.path();

        // Print the path (as a string) of the entry
        if let Some(file_name) = path.file_name() {
            if let Some(file_name_str) = file_name.to_str() {
                print!("{} ", file_name_str);
            }
        }
    }

    println!("");

    Ok(())
}
