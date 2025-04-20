using Statistics

function fibo(n::Number)
    if n < 2
        return n
    else
        return fibo(n-1) + fibo(n-2)
    end
end

loop_count = 21
target = 36
x = fibo(target)
results = Float64[]

for i = 1:loop_count
    s = time()
    fibo(target)
    e = time()
    push!(results, e - s)
end
sort!(results)
println("Julia value:", x)
println("Julia min:", results[1])
println("Julia max:", results[end])
println("Julia median:", results[loop_count ÷ 2 + 1])  # 1 indexing!
