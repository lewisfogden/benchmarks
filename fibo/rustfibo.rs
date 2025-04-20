use std::time::Instant;

fn fib(num: u128) -> u128 {  
    match num {
        0|1 => num,
        _ => fib(num - 1) + fib(num - 2)
    }
}

fn main() {
    let loops = 21;
    let mut x = 0;
    let mut times: Vec<u128> = vec![];
    for _ in 0..loops {
        let before = Instant::now();
        x = fib(36);
        let elapsed = before.elapsed().as_nanos();
        println!("Elapsed time: {:.5?}", elapsed);
        times.push(elapsed);
        
    }
    times.sort();
    println!("Median: {:?}", times[loops / 2]);
    // time as second
    let time: f64 = (times[loops / 2] as f64) / 1e9;
    println!("as Secs {:?}", time);
    println!("{:?}", x)
}