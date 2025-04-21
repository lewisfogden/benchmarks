import time
from sys import argv

# using fake inner makes mojo faster???   (faster than just returning fibo(n)?!?)

# standard definition

fn fibo1(n: Int) -> Int:
    if n < 2:
        return n
    else:
        return fibo1(n - 1) + fibo1(n - 2)

# with a fake inner function

fn inner2(n: Int) -> Int:
    return fibo2(n)

fn fibo2(n: Int) -> Int:
    if n < 2:
        return n
    else:
        return inner2(n - 1) + inner2(n - 2)

# with an inner function that adds and subtracts one

fn inner_add(n: Int) -> Int:
    val = fibo3(n) - 1
    return val + 1 # comment

fn fibo3(n: Int) -> Int:
    if n < 2:
        return n
    else:
        return inner_add(n - 1) + inner_add(n - 2)

def main():
    var results = List[Int]()
    var x: Int = 0
    loop_count = 21
    arguments = argv()  # pass in n=36 as the argument

    target = Int(arguments[1])

    for _ in range(loop_count):
        s = time.perf_counter_ns()
        x = fibo1(target)
        e = time.perf_counter_ns()
        t = e - s
        results.append(t)
        print('Mojo fibo1 elapsed:', t/1000000, x)
    
    for _ in range(loop_count):
            s = time.perf_counter_ns()
            x = fibo2(target)
            e = time.perf_counter_ns()
            t = e - s
            results.append(t)
            print('Mojo fibo2 elapsed:', t/1000000, x)

    for _ in range(loop_count):
            s = time.perf_counter_ns()
            x = fibo3(target)
            e = time.perf_counter_ns()
            t = e - s
            results.append(t)
            print('Mojo fibo3 elapsed:', t/1000000, x)

    print("mojo val:", x)
    sort(results)
    print("Mojo min:", results[0])
    print("Mojo max:", results[-1])
    print("Mojo median:", results[loop_count // 2])