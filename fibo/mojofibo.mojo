import time

fn fibo(n: Int) -> Int:
    if n < 2:
        return n
    else:
        return fibo(n - 1) + fibo(n - 2)

def main():
    var results = List[Float64]()
    var x: Int = 0
    loop_count = 21
    target = 36
    for _ in range(loop_count):
        s = time.perf_counter()
        x = fibo(target)
        e = time.perf_counter()
        t = e - s
        results.append(t)
    print("mojo val", x)
    sort(results)
    print("Mojo min:", results[0])
    print("Mojo max:", results[-1])
    print("Mojo median:", results[loop_count // 2])