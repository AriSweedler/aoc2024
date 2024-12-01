use std::env;
use std::fs::File;
use std::io::{self, BufRead};

fn main() {
    // Determine the file path
    let file_path = env::args()
        .nth(1)
        .unwrap_or_else(|| "input.aoc".to_string());

    // Open the file
    let file = File::open(&file_path).unwrap_or_else(|_| {
        eprintln!("Error: Unable to open file '{}'", file_path);
        std::process::exit(1);
    });
    let handle = io::BufReader::new(file);

    // Create a Vec to store each team's list
    let mut team1_list: Vec<u32> = Vec::new();
    let mut team2_list: Vec<u32> = Vec::new();

    // Iterate through each line of input
    for line in handle.lines() {
        match line {
            Ok(l) => process_line(&l, &mut team1_list, &mut team2_list),
            Err(e) => eprintln!("Error reading line: {}", e), // Handle read error
        }
    }

    // Sort the vectors
    team1_list.sort();
    team2_list.sort();

    // Compute an answer
    let ans: u32 = team1_list
        .iter()
        .zip(team2_list.iter())
        .map(|(t1, t2)| (t1.abs_diff(*t2)))
        .sum();
    println!("{}", ans);
}

fn process_line(line: &str, team1_list: &mut Vec<u32>, team2_list: &mut Vec<u32>) {
    // Split the line on whitespace and collect the parts into an iterator
    let parts: Vec<&str> = line.split_whitespace().collect();

    if parts.len() != 2 {
        eprintln!("Error: Expected exactly 2 elements, found {}", parts.len());
        std::process::exit(1);
    }

    let parsed_parts: Vec<u32> = parts
        .iter()
        .map(|part| {
            part.parse::<u32>().unwrap_or_else(|_| {
                eprintln!("Error: '{}' is not a valid integer", part);
                std::process::exit(1);
            })
        })
        .collect();

    team1_list.push(parsed_parts[0]);
    team2_list.push(parsed_parts[1]);
}
