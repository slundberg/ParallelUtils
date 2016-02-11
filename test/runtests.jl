using ParallelUtils
using Base.Test

@ensureworkers(5)

a = 1
sendto(2, a2=a)
@test getfrom(2, :a2) == 1
