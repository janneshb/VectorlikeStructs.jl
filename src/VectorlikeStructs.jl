module VectorlikeStructs

include("indexify.jl")

export @vectorlike

macro vectorlike(T)
    expr = _indexify(T)
    return esc(expr)
end

end # module VectorlikeStructs
