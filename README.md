# VectorlikeStructs.jl

This package exports the macro `@vectorlike` that lets you define structs that behave like vectors.

For example, maybe you have a state vector for a three-dimensional rigid body with six degrees of freedom. So the state is described by

```julia
@vectorlike struct SixDoFState
    p   # position
    v   # velocity
    q   # orientation quaternion
    ω   # angular rates
end
x = SixDoFState(
    [1.0, 2.0, 3.0],
    [0.5, 0.1, 0.7],
    [1.0, 0.0, 0.0, 0.0],
    [1.0, 2.0, 3.0],
)
```

The position, velocity and angular rates are each three-dimensional vectors, while the orientation quaternion has four elements.

Since the `@vectorlike` macro was used a `SixDoFState` object has similar properties like a vector. So it supports **scalar-vector multiplications**
```julia
x2 = 2.0*x
```

and **vector additions**
```julia
x3 = x1 + x2
```

or **matrix-vector multiplications**
```julia
x2 = A*x
```

Different elements of the `SixDoFState` can be accessed as usual
```julia
p_y = x.p[2]
```

or via indexing
```julia
v_x = x[4]
```

Also, different vectorlike structs can also be nested. For example, we can define a quaternion struct
```julia
@vectorlike struct Quaternion
    w
    x
    y
    z
end
x = SixDofState(
    [1.0, 2.0, 3.0],
    [0.5, 0.1, 0.7],
    Quaternion(1.0, 0.0, 0.0, 0.0),
    [1.0, 2.0, 3.0],
)
```
which doesn't change the behavior of the `SixDoFState` objects, but make it easier to access elements of the quaternion (e.g. `q_w = x.q.w`).
