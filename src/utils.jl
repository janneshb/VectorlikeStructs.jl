function _find_struct_name(expr)
    if expr.head == :struct
        if expr.args[2] isa Symbol
            return expr.args[2]
        end

        s_name = expr.args[2]
        while s_name isa Expr
            s_name = s_name.args[1]
        end
        return s_name
    elseif expr.head == :macrocall
        name = _find_struct_name(expr.args[3])
        if name !== nothing
            return name
        else
            error("Could not find a struct definition in what was passed to @vectorlike.")
        end
    end
    return nothing
end
