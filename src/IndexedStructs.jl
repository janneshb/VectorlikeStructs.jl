module IndexedStructs

export @indexed

macro indexed(T)
    expr = _indexify(T)
    return esc(expr)
end

function _find_struct_name(expr)
    if expr.head == :struct
        if expr.args[2] isa Symbol
            return expr.args[2]
        elseif expr.args[2] isa Expr
            return expr.args[2].args[1]
        end
    elseif expr.head == :macrocall
        name = _find_struct_name(expr.args[3])
        if name !== nothing
            return name
        else
            error("Could not find a struct definition in what was passed to @indexed.")
        end
    end
    return nothing
end

function _indexify(expr)
    T = _find_struct_name(expr)

    return quote
        $expr

        function Base.getindex(t::S, i::I) where {S <: $T, I}
            getfield(t, fieldnames($T)[i])
        end
    end
end

end # module IndexedStructs
