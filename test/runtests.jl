using Test
using IndexedStructs

@testset "Simple Use" begin
    # with types
    @indexed struct MyTestStruct1
        a::Float64
        b::Int64
        c::Bool
    end
    
    t1 = MyTestStruct1(1.0, 2, true)
    @test t1.a == t1[1]
    @test t1.b == t1[2]
    @test t1.c == t1[3]

    # without types
    @indexed struct MyTestStruct2
        a
        b
        c
    end
    
    t2 = MyTestStruct2(10.0, 20, false)
    @test t2.a == t2[1]
    @test t2.b == t2[2]
    @test t2.c == t2[3]
end

@testset "Use with @kwdef" begin
    @indexed Base.@kwdef struct MyTestStruct3
        a::Float64 = 1.5
        b::Int64 = 42
        c::Bool = true
    end
    
    t3 = MyTestStruct3(c = false)
    @test t3.a == t3[1]
    @test t3.b == t3[2]
    @test t3.c == t3[3]
    
end