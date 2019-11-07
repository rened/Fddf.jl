println("\n\n\nStarting runtests.jl $(join(ARGS, " ")) ...")

push!(LOAD_PATH, normpath(joinpath(@__DIR__, "../..")))
@show LOAD_PATH
using Test, FunctionalDataUtils, DataFrames, Fddf

macro shouldtestset(a,b) length(ARGS) < 1 || ARGS[1] == a ?  :(@testset $a $b) : nothing end
macro shouldtestset2(a,b) length(ARGS) < 2 || ARGS[2] == a ?  :(@testset $a $b) : nothing end

@shouldtestset "fddf" begin
    a = DataFrame()
    a.a = 1:3
    a.b = [11,22,33]
    b = fd(a)
    @test b[1][:a]  ==  1
    @test b[2][:a]  ==  2
    @test b[3][:a]  ==  3
    @test b[1][:b]  ==  11
    @test b[2][:b]  ==  22
    @test b[3][:b]  ==  33
    c = df(b)
    @test a  ==  c
end

