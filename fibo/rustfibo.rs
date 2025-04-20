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
    for _ in 0..loops {
        let before = Instant::now();
        x = fib(36);
        let elapsed = before.elapsed().as_nanos();
        println!("Elapsed time: {:.5?}", elapsed);
        
    }
    println!("{:?}", x)
}