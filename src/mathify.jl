
REGISTERED_FUNCTIONS = [
    #def_zero,
    #def_one,
    #def_plus,
    #def_minus,
    #def_multi,
    #def_div,
]

function _mathify(T)
    math_expressions = []
    for f in REGISTERED_FUNCTIONS
        push!(math_expressions, f(T))
    end
    return Expr(:block, math_expressions...)
end
