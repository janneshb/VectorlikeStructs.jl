module IndexedStructs

export @indexed

macro indexed(T)
esc(:(
    function Base.getindex(t::S, i::I) where {S <: $T, I}
        getfield(t, fieldnames($T)[i])
    end
))
end

end # module IndexedStructs
