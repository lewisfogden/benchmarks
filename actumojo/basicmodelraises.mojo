from collections import Dict
import benchmark

struct Data:
    var init_age: Int

    fn __init__(out self, init_age: Int):
        self.init_age = init_age

    fn __copyinit__(out self, existing: Self):
        self.init_age = existing.init_age

struct Cache:
    """A cache has a store for each modelled value we want to retain."""
    var age: Dict[Int, Int]
    var num_pols_if: Dict[Int, Float64]

    fn __init__(out self):
        self.age = Dict[Int, Int]()
        self.num_pols_if = Dict[Int, Float64]()

struct Model:
    var data: Data
    var cache: Cache
    var proj_len: Int

    fn __init__(out self, data: Data, proj_len: Int) raises:
        self.data = data
        self.cache = Cache()
        self.proj_len = proj_len
        self._run(proj_len)

    fn _run(mut self, proj_len:Int) raises:
        for t in range(proj_len + 1):
            # explicitly run each function here.
            _ = self.num_pols_if(t)
            _ = self.age(t)

    fn num_pols_if(mut self, t: Int) raises -> Float64:
        # TODO: is raises + if t in <array> faster than try/except?
        var result: Float64
        if t in self.cache.num_pols_if:
            return self.cache.num_pols_if[t]
        else:
            if t == 0:
                result = 1.0
            else:
                result = self.num_pols_if(t - 1) * 0.97
            self.cache.num_pols_if[t] = result
            return result

    fn age(mut self, t: Int) raises -> Int:
        var result: Int
        if t in self.cache.age:
            return self.cache.age[t]
        else:
            if t == 0:
                result = self.data.init_age
            else:
                result = self.age(t - 1) + 1
            self.cache.age[t] = result
            return result

fn test_run() raises:
    data = Data(init_age=30)
    _ = Model(data=data, proj_len=2500)

def main():
    data = Data(init_age=30)
    model = Model(data=data, proj_len=10)
    #print(model.age(5))
    #print(model.num_pols_if(20))
    #for k in model.cache.age:
    #    print(k[], model.cache.age[k[]])

    #for k in model.cache.num_pols_if:
    #    print(k[], model.cache.num_pols_if[k[]])
    print(model.num_pols_if(2499))
    print("Running Benchmarks - Raises")
    var report = benchmark.run[test_run]()
    report.print(benchmark.Unit.ms)