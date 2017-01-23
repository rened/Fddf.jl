println("\n\n\nStarting runtests.jl $(join(ARGS, " ")) ...")
# addprocs(3)
using FactCheck, FunctionalDataUtils, DataFrames, Fddf
FactCheck.setstyle(:compact)

shouldtest(f, a) = length(ARGS) == 0 || a == ARGS[1] ? facts(f, a) : nothing
shouldtestcontext(f, a) = length(ARGS) < 2 || a == ARGS[2] ? facts(f, a) : nothing

    
shouldtest("fddf") do
    a = DataFrame()
    a[:a] = 1:3
    a[:b] = [11,22,33]
    b = fd(a)
    @fact b[1][:a]  -->  1
    @fact b[2][:a]  -->  2
    @fact b[3][:a]  -->  3
    @fact b[1][:b]  -->  11
    @fact b[2][:b]  -->  22
    @fact b[3][:b]  -->  33
    c = df(b)
    @fact a  -->  c
end

FunctionalDataUtils.exitwithteststatus()
