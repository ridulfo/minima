use std::fs;

fn main() -> std::io::Result<()> {
    // Specify the directory path you want to list
    let path = ".";  // Current directory, change this as needed

    // Read the directory entries
    let entries = fs::read_dir(path)?;

    // Iterate over the entries and print their names
    for entry in entries {
        let entry = entry?;
        let file_name = entry.file_name();
        let file_name_str = file_name.to_string_lossy(); // Convert OsString to String
        print!("{}  ", file_name_str);
    }

    Ok(())
}

