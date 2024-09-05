function _indexify(T)
    quote
        function Base.getindex(t::S, i::I) where {S <: $T, I}
            getfield(t, fieldnames($T)[i])
        end
    end
end
