use std::thread::sleep;

fn main() {
    println!("Welcome to Minima OS!");
    println!("Going to sleep now...");
    loop {
        sleep(std::time::Duration::from_secs(1));
        println!("Zzz...")
    }
}
