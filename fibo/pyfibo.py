import time

def fibo(n: int) -> int:
    if n < 2:
        return n
    else:
        return fibo(n-1) + fibo(n-2)

loop_count = 5  # all the others use 21 but python is slow.
target = 36
results = []

for _ in range(loop_count):
    start = time.perf_counter()
    x = fibo(target)
    end = time.perf_counter()
    #print(end - start)
    results.append(end - start)

print("python val:", x)
results.sort()
print("Python min:", results[0])
print("Python max:", results[-1])
print("python median", results[loop_count // 2])
