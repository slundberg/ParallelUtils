# ParallelUtils.jl
[![Build Status](https://travis-ci.org/slundberg/ParallelUtils.jl.svg?branch=master)](https://travis-ci.org/slundberg/ParallelUtils.jl)

Simple utilities for working with parallel computing in Julia.

## @ensureworkers
```julia
# unlike addprocs this is idempotent (safe to call multiple times)
# it also loads ParallelUtils on all the created workers
@ensureworkers(10)
```

## sendto
(from http://stackoverflow.com/questions/27677399/julia-how-to-copy-data-to-another-processor-in-julia)

```julia
# creates an integer x and Matrix y on processes 1 and 2
sendto([1, 2], x=100, y=rand(2, 3))

# create a variable here, then send it everywhere else
z = randn(10, 10); sendto(workers(), z=z)
```

## getfrom
(from http://stackoverflow.com/questions/27677399/julia-how-to-copy-data-to-another-processor-in-julia)
```julia
# get an object from named x from Main module on process 2. Name it x
x = getfrom(2, :x)
```
