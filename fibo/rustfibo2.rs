use std::time::Instant;

fn fibo0(num: u64) -> u64 {  
    match num {
        0|1 => num,
        _ => fibo0(num - 1) + fibo0(num - 2)
    }
}

fn fibo1(n: u64) -> u64 {
    if n < 2 {
        return n;
    } else {
        return fibo1(n - 1) + fibo1(n - 2);
    }
}

fn inner_add(n: u64) -> u64 {
    let val = fibo3(n) + 1;
    return val - 1;

}
fn fibo3(n: u64) -> u64 {
    if n < 2 {
        return n;
    } else {
        return inner_add(n - 1) + inner_add(n - 2);
    }
}

fn main() {
    let loops = 21;
    let mut x = 0;
    let mut times: Vec<u128> = vec![];
    for _ in 0..loops {
        let before = Instant::now();
        x = fibo0(36);
        let elapsed = before.elapsed().as_nanos();
        println!("Fibo0 Elapsed time: {:.5?} {:0?}", elapsed / 1000000, x);
        times.push(elapsed);
        
    }

    for _ in 0..loops {
        let before = Instant::now();
        x = fibo1(36);
        let elapsed = before.elapsed().as_nanos();
        println!("Fibo1 Elapsed time: {:.5?} {:0?}", elapsed / 1000000, x);
        times.push(elapsed);
        
    }

    for _ in 0..loops {
        let before = Instant::now();
        x = fibo3(36);
        let elapsed = before.elapsed().as_nanos();
        println!("Fibo3 Elapsed time: {:.5?} {:0?}", elapsed / 1000000, x);
        times.push(elapsed);
        
    }

    times.sort();
    println!("Median: {:?}", times[loops / 2]);
    // time as second
    let time: f64 = (times[loops / 2] as f64) / 1e9;
    println!("as Secs {:?}", time);
    println!("{:?}", x)
}