# zero()
function def_zero(T)
    quote
        function Base.:zero(t::$T)
            
        end
    end
end

# one()
function def_one(T)
quote
    function Base.:one(t::$T)

    end
end
end

# addition with each other
function def_plus(T)
quote
    function Base.:+(t1::$T, t2::$T)

    end
end
end

# subtraction with each other
function def_minus(T)
quote
    function Base.:-(t1::$T, t2::$T)

    end
end
end

# multiplication with a scalar
function def_multi(T)
quote
    function Base.:*(s::Number, t::$T)
        args = []
        for f in fieldnames($T)
            push!(args, s*getfield(t, f))
        end
        return $T(args...)
    end

    function Base.:*(t::$T, s::Number)
        s * t
    end
end
end

# division by a scalar
function def_div(T)
quote
    function Base.:/(t::$T, s::Number)

    end
end
end

REGISTERED_FUNCTIONS = [
    #def_zero,
    #def_one,
    #def_plus,
    #def_minus,
    def_multi,
    #def_div,
]

function _mathify(T)
    math_expressions = []
    for f in REGISTERED_FUNCTIONS
        push!(math_expressions, f(T))
    end
    return Expr(:block, math_expressions...)
end
