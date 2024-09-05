module VectorlikeStructs

include("utils.jl")
include("indexify.jl")
include("mathify.jl")

export @vectorlike

macro vectorlike(expr)
    T = _find_struct_name(expr)
    def_quote = :($expr)
    indexify_quote = _indexify(T)
    math_quote = _mathify(T)
    return esc(Expr(:block, def_quote, indexify_quote, math_quote))
end

end # module VectorlikeStructs
