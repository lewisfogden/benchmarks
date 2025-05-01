use std::time::Instant;

fn fibo(n: u64) -> u64 {
    if n < 2 {
        return n;
    } else {
        return fibo(n - 1) + fibo(n - 2);
    }
}

fn main() {
    let loops = 21;
    let mut x = 0;
    let mut times: Vec<u128> = vec![];
    for _ in 0..loops {
        let before = Instant::now();
        x = fibo(36);
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